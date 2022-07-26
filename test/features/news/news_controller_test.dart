import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microblog/core/data/api.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/news/data/news_entity.dart';
import 'package:microblog/features/news/data/news_response.dart';
import 'package:microblog/features/news/news_controller.dart';
import 'package:microblog/features/news/news_find_all_use_case.dart';
import 'package:microblog/features/news/news_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_controller_test.mocks.dart';

@GenerateMocks([
  IRouter,
  NewsFindAllUseCase,
  NewsRepository,
  Api,
])
void main() {
  final mockRepository = MockNewsRepository();

  group('news controller test cases', () {
    test('should be loaded news', () async {
      when(
        mockRepository.findNews(
          request: anyNamed('request'),
        ),
      ).thenAnswer(
        (_) => Future.value(
          right(
            NewsResponse(
              news: [
                News(
                  message: Message(
                    content: 'test',
                    createdAt: DateTime.now(),
                  ),
                  user: User(
                    name: 'test',
                    profilePicture: 'photo',
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      final controller = NewsController(
        router: MockIRouter(),
        newsFindAllUseCase: NewsFindAllUseCase(
          repository: mockRepository,
        ),
      );

      await controller.reload();

      expect(controller.news.length, 1);
    });
  });
}
