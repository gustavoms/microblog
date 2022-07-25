import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/api.dart';
import 'package:microblog/features/news/data/news_request.dart';
import 'package:microblog/features/news/data/news_response.dart';
import 'package:microblog/features/news/exceptions/news_exception.dart';

abstract class INewsRepository {
  Future<Either<NewsException, NewsResponse>> findNews({
    required NewsRequest request,
  });
}

class NewsRepository extends INewsRepository {
  final Api api;

  NewsRepository({
    required this.api,
  });

  @override
  Future<Either<NewsException, NewsResponse>> findNews({
    required NewsRequest request,
  }) async {
    try {
      final response = await api.get('/data.json');

      if (response.isOk) {
        return right(
          NewsResponse.fromJson(response.body),
        );
      }

      return left(
        NewsException(
          cause: 'error_occurred'.tr,
        ),
      );
    } on Exception catch (e) {
      return Left(
        NewsException(
          cause: e.toString(),
        ),
      );
    }
  }
}
