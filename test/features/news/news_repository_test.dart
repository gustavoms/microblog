import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/connect.dart';
import 'package:microblog/core/data/api.dart';
import 'package:microblog/features/news/data/news_request.dart';
import 'package:microblog/features/news/news_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_repository_test.mocks.dart';

@GenerateMocks([
  Api,
  NewsRequest,
])
void main() {
  group('news repository test cases', () {
    final mockApi = MockApi();
    final mockRequest = MockNewsRequest();

    test('should be successful response', () async {
      final repository = NewsRepository(api: mockApi);

      when(mockApi.get('/data.json')).thenAnswer(
        (_) => Future.value(
          const Response(
            body: {
              "news": [
                {
                  "message": {
                    "content": "test",
                    "created_at": "2020-01-01T00:00:00.000Z"
                  },
                  "user": {"name": "test", "profile_picture": "photo"}
                }
              ]
            },
            statusCode: 200,
          ),
        ),
      );

      final response = await repository.findNews(
        request: mockRequest,
      );

      expect(response.isRight(), true);
    });

    test('should be failure response', () async {
      final repository = NewsRepository(api: mockApi);

      when(mockApi.get('/data.json')).thenAnswer(
        (_) => Future.value(
          const Response(
            body: {},
            statusCode: 500,
          ),
        ),
      );

      final response = await repository.findNews(
        request: mockRequest,
      );

      expect(response.isLeft(), true);
    });
  });
}
