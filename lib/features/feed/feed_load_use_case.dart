import 'package:dartz/dartz.dart';
import 'package:microblog/features/feed/data/feed_request.dart';
import 'package:microblog/features/feed/data/feed_response.dart';
import 'package:microblog/features/feed/exceptions/feed_exception.dart';
import 'package:microblog/features/feed/feed_repository.dart';

class FeedLoadUseCase {
  final IFeedRepository repository;

  FeedLoadUseCase({
    required this.repository,
  });

  Future<Either<FeedException, FeedResponse>> call({
    required FeedRequest data,
  }) async {
    return await repository.feedLoad(
      request: data,
    );
  }
}
