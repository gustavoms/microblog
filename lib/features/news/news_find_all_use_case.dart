import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:microblog/features/news/data/news_entity.dart';
import 'package:microblog/features/news/data/news_request.dart';
import 'package:microblog/features/news/data/news_response.dart';
import 'package:microblog/features/news/exceptions/news_exception.dart';
import 'package:microblog/features/news/news_repository.dart';

class NewsFindAllUseCase {
  final INewsRepository repository;

  NewsFindAllUseCase({
    required this.repository,
  });

  Future<Either<NewsException, List<NewsEntity>>> call({
    required NewsRequest data,
  }) async {
    final response = await repository.findNews(request: data);

    if (response.isRight()) {
      final r = response.getOrElse(() => NewsResponse());
      return right(r.news
              ?.map(
                (e) => NewsEntity(
                  user: UserNews(
                    name: e.user?.name,
                    profilePicture: e.user?.profilePicture,
                  ),
                  message: MessageNews(
                    content: e.message?.content,
                    createdAt: e.message?.createdAt,
                  ),
                ),
              )
              .toList() ??
          []);
    }

    return left(
      NewsException(
        cause: 'error_occurred'.tr,
      ),
    );
  }
}
