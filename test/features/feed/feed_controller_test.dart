import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/feed/feed_controller.dart';
import 'package:microblog/features/post/data/post_entity.dart';
import 'package:microblog/features/post/data/post_response.dart';
import 'package:microblog/features/post/exceptions/post_exception.dart';
import 'package:microblog/features/post/post_find_all_use_case.dart';
import 'package:microblog/features/post/post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'feed_controller_test.mocks.dart';

@GenerateMocks([
  IRouter,
  PostFindAllUseCase,
  IPostRepository,
  IStorage,
  MicroblogDatabase,
  SnackbarController,
  PostException,
])
void main() {
  group('feed controller testing cases', () {
    final MockIRouter router = MockIRouter();
    final MockPostFindAllUseCase postFindAllUseCase = MockPostFindAllUseCase();
    final MockIStorage storage = MockIStorage();

    tearDown(() {
      Get.reset();
    });

    test('should be fine user id connected', () async {
      when(storage.getUserId()).thenAnswer((_) => Future.value(1));

      final controller = FeedController(
        router: router,
        storage: storage,
        postFindAllUseCase: postFindAllUseCase,
      );

      await controller.loadCurrentUserId();
      expect(controller.currentUserId, 1);
    });

    test('should be snackbar error executed', () async {
      final exception = MockPostException();
      when(exception.cause).thenReturn('fail');

      when(postFindAllUseCase.call()).thenAnswer(
        (_) => Future.value(
          left(
            exception,
          ),
        ),
      );

      when(router.showSnackbarError(message: anyNamed('message'))).thenReturn(
        MockSnackbarController(),
      );

      final controller = FeedController(
        router: router,
        storage: storage,
        postFindAllUseCase: postFindAllUseCase,
      );

      await controller.reload();
      verify(router.showSnackbarError(message: anyNamed('message'))).called(1);
    });

    test('should be success reload fun', () async {
      when(postFindAllUseCase.call()).thenAnswer(
        (_) => Future.value(
          right(
            PostResponse(
              posts: [
                PostEntity(
                  id: 1,
                  message: 'message',
                  userId: 1,
                  date: DateTime.now(),
                  user: 'user',
                  photo: 'photo',
                ),
              ],
            ),
          ),
        ),
      );

      final controller = FeedController(
        router: router,
        storage: storage,
        postFindAllUseCase: postFindAllUseCase,
      );

      await controller.reload();

      expect(controller.feedPosts.length, 1);
    });
  });
}
