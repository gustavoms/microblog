import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/home/exceptions/home_enable_dark_mode_exception.dart';
import 'package:microblog/features/home/home_controller.dart';
import 'package:microblog/features/home/home_enable_dark_mode_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([
  IRouter,
  HomeEnableDarkModeUseCase,
  IStorage,
  SnackbarController,
  HomeEnableDarkModeException,
])
void main() {
  group('home controller testing cases', () {
    final MockIRouter router = MockIRouter();
    final MockHomeEnableDarkModeUseCase homeEnableDarkModeUseCase =
        MockHomeEnableDarkModeUseCase();
    final MockIStorage storage = MockIStorage();

    tearDown(() {
      Get.reset();
    });

    test('should be fine user connected', () async {
      when(storage.getUserId()).thenAnswer((_) => Future.value(1));
      when(storage.getUserEmail())
          .thenAnswer((_) => Future.value('test@test.com'));
      when(storage.getUserName()).thenAnswer((_) => Future.value('test'));

      final controller = HomeController(
        router: router,
        storage: storage,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
      );

      await controller.getUserEmail();
      await controller.getUserName();

      expect(controller.userEmail, 'test@test.com');
      expect(controller.userName, 'test');
    });

    test('should be router executed', () async {
      when(
        router.startPostPage(
          parameters: anyNamed('parameters'),
          off: anyNamed('off'),
        ),
      ).thenAnswer((_) => Future.value());
      final controller = HomeController(
        router: router,
        storage: storage,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
      );

      await controller.startCreatePost();

      verify(
        router.startPostPage(
          parameters: anyNamed('parameters'),
          off: anyNamed('off'),
        ),
      ).called(1);
    });

    test('should be success change dark theme', () async {
      when(
        homeEnableDarkModeUseCase.call(
          enable: anyNamed('enable'),
        ),
      ).thenAnswer(
        (_) => Future.value(
          right(true),
        ),
      );

      final controller = HomeController(
        router: router,
        storage: storage,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
      );

      await controller.changeDarkMode(true);

      expect(controller.darkMode, true);
    });

    test('should be failure change dark theme', () async {
      when(
        homeEnableDarkModeUseCase.call(
          enable: anyNamed('enable'),
        ),
      ).thenAnswer(
        (_) => Future.value(
          left(
            HomeEnableDarkModeException(cause: 'fail'),
          ),
        ),
      );

      final controller = HomeController(
        router: router,
        storage: storage,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
      );

      when(router.showSnackbarError(message: anyNamed('message'))).thenReturn(
        MockSnackbarController(),
      );

      await controller.changeDarkMode(true);
      verify(router.showSnackbarError(message: anyNamed('message'))).called(1);
    });
  });
}
