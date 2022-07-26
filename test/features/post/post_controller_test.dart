import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/post/post_controller.dart';
import 'package:microblog/features/post/post_create_use_case.dart';
import 'package:microblog/features/post/post_delete_use_case.dart';
import 'package:microblog/features/post/post_repository.dart';
import 'package:microblog/features/post/post_update_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_controller_test.mocks.dart';

@GenerateMocks([
  PostCreateUseCase,
  PostUpdateUseCase,
  PostDeleteUseCase,
  PostRepository,
  IStorage,
  IRouter,
  SnackbarController,
])
void main() {
  group('post controller test cases', () {
    final mockPostCreateUseCase = MockPostCreateUseCase();
    final mockPostUpdateUseCase = MockPostUpdateUseCase();
    final mockPostDeleteUseCase = MockPostDeleteUseCase();
    final mockStorage = MockIStorage();
    final mockRouter = MockIRouter();

    tearDown(() {
      Get.reset();
    });

    setUpAll(() {
      when(mockStorage.getUserId())
          .thenAnswer((realInvocation) => Future.value(1));
    });

    test('should be successful create post response', () async {
      final controller = PostController(
        router: mockRouter,
        storage: mockStorage,
        postCreateUseCase: mockPostCreateUseCase,
        postUpdateUseCase: mockPostUpdateUseCase,
        postDeleteUseCase: mockPostDeleteUseCase,
      );

      Get.put(controller);

      when(mockRouter.goBack(
        canPop: anyNamed('canPop'),
        id: anyNamed('id'),
        result: anyNamed('result'),
        closeOverlays: anyNamed('closeOverlays'),
      )).thenAnswer(
        (_) => Future.value(),
      );

      when(mockRouter.showSnackbarSuccess(message: anyNamed('message')))
          .thenAnswer(
        (_) => MockSnackbarController(),
      );

      when(mockPostCreateUseCase.call(
        data: anyNamed('data'),
      )).thenAnswer(
        (_) => Future.value(
          right(true),
        ),
      );

      await controller.createPost();

      verify(
        mockRouter.goBack(
          canPop: anyNamed('canPop'),
          id: anyNamed('id'),
          result: anyNamed('result'),
          closeOverlays: anyNamed('closeOverlays'),
        ),
      ).called(1);
    });

    test('should be successful update post response', () async {
      final controller = PostController(
        router: mockRouter,
        storage: mockStorage,
        postCreateUseCase: mockPostCreateUseCase,
        postUpdateUseCase: mockPostUpdateUseCase,
        postDeleteUseCase: mockPostDeleteUseCase,
      );

      Get.put(controller);

      when(mockRouter.goBack(
        canPop: anyNamed('canPop'),
        id: anyNamed('id'),
        result: anyNamed('result'),
        closeOverlays: anyNamed('closeOverlays'),
      )).thenAnswer(
        (_) => Future.value(),
      );

      when(mockRouter.showSnackbarSuccess(message: anyNamed('message')))
          .thenAnswer(
        (_) => MockSnackbarController(),
      );

      when(mockPostUpdateUseCase.call(
        data: anyNamed('data'),
      )).thenAnswer(
        (_) => Future.value(
          right(true),
        ),
      );

      await controller.updatePost();

      verify(
        mockRouter.goBack(
          canPop: anyNamed('canPop'),
          id: anyNamed('id'),
          result: anyNamed('result'),
          closeOverlays: anyNamed('closeOverlays'),
        ),
      ).called(1);
    });

    test('should be successful delete post response', () async {
      final controller = PostController(
        router: mockRouter,
        storage: mockStorage,
        postCreateUseCase: mockPostCreateUseCase,
        postUpdateUseCase: mockPostUpdateUseCase,
        postDeleteUseCase: mockPostDeleteUseCase,
      );

      Get.put(controller);

      when(mockRouter.goBack(
        canPop: anyNamed('canPop'),
        id: anyNamed('id'),
        result: anyNamed('result'),
        closeOverlays: anyNamed('closeOverlays'),
      )).thenAnswer(
        (_) => Future.value(),
      );

      when(mockRouter.showSnackbarSuccess(message: anyNamed('message')))
          .thenAnswer(
        (_) => MockSnackbarController(),
      );

      when(mockPostDeleteUseCase.call(
        id: anyNamed('id'),
      )).thenAnswer(
        (_) => Future.value(
          right(true),
        ),
      );

      await controller.deletePost();

      verify(
        mockRouter.goBack(
          canPop: anyNamed('canPop'),
          id: anyNamed('id'),
          result: anyNamed('result'),
          closeOverlays: anyNamed('closeOverlays'),
        ),
      ).called(1);
    });
  });
}
