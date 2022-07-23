import 'package:dartz/dartz.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/features/feed/data/feed_entity.dart';
import 'package:microblog/features/feed/data/feed_request.dart';
import 'package:microblog/features/feed/data/feed_response.dart';
import 'package:microblog/features/feed/exceptions/feed_exception.dart';

abstract class IFeedRepository {
  Future<Either<FeedException, FeedResponse>> feedLoad({
    required FeedRequest request,
  });
}

class FeedRepository extends IFeedRepository {
  final MicroblogDatabase database;

  FeedRepository({
    required this.database,
  });

  @override
  Future<Either<FeedException, FeedResponse>> feedLoad({
    required FeedRequest request,
  }) async {
    try {
      final posts = await (await database.getInstance()).rawQuery(
        'SELECT * FROM post p left join user u on u.id = p.user_id order by p.data',
      );

      return right(
        FeedResponse(
          posts: posts
              .map(
                (e) => FeedEntity(
                  user: e['name'].toString(),
                  date: DateTime.tryParse(
                        e['date'].toString(),
                      ) ??
                      DateTime.now(),
                  message: e['post'].toString(),
                  photo: 'https://picsum.photos/200/300',
                ),
              )
              .toList(),
        ),
      );
    } on Exception catch (e) {
      return Left(
        FeedException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }
}
