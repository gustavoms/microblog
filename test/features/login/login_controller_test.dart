import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/core/shared/assets_const.dart';
import 'package:microblog/features/home/exceptions/home_enable_dark_mode_exception.dart';
import 'package:microblog/features/home/home_enable_dark_mode_use_case.dart';
import 'package:microblog/features/login/data/login_response.dart';
import 'package:microblog/features/login/exceptions/login_execute_exception.dart';
import 'package:microblog/features/login/login_controller.dart';
import 'package:microblog/features/login/login_execute_use_case.dart';
import 'package:microblog/features/login/login_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_controller_test.mocks.dart';

@GenerateMocks([
  IRouter,
  HomeEnableDarkModeUseCase,
  IStorage,
  ILoginRepository,
  SnackbarController,
  HomeEnableDarkModeException,
  LoginExecuteUseCase,
])
void main() {
  group('login controller testing cases', () {
    final MockIRouter router = MockIRouter();
    final MockHomeEnableDarkModeUseCase homeEnableDarkModeUseCase =
        MockHomeEnableDarkModeUseCase();
    final MockLoginExecuteUseCase loginExecuteUseCase =
        MockLoginExecuteUseCase();

    tearDown(() {
      Get.reset();
    });

    test('should be router executed signup', () async {
      when(
        router.startSignupPage(
          off: anyNamed('off'),
        ),
      ).thenAnswer((_) => Future.value());

      final controller = LoginController(
        router: router,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
        loginExecuteUseCase: loginExecuteUseCase,
      );

      Get.put(controller);

      await controller.onSignup();

      verify(
        router.startSignupPage(
          off: anyNamed('off'),
        ),
      ).called(1);
    });

    test('should be success login', () async {
      when(
        loginExecuteUseCase.call(
          data: anyNamed('data'),
        ),
      ).thenAnswer(
        (_) => Future.value(
          right(
            LoginResponse(
              success: true,
              user: 'test',
              email: 'test@test.com',
              id: 1,
            ),
          ),
        ),
      );

      when(
        router.startHomePage(
          off: anyNamed('off'),
          parameters: anyNamed('parameters'),
        ),
      ).thenAnswer((_) => Future.value());

      final controller = LoginController(
        router: router,
        loginExecuteUseCase: loginExecuteUseCase,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
      );

      Get.put(controller);

      await controller.onLogin();

      verify(
        router.startHomePage(
          off: anyNamed('off'),
          parameters: anyNamed('parameters'),
        ),
      ).called(1);
    });

    test('should be failure login', () async {
      when(
        loginExecuteUseCase.call(
          data: anyNamed('data'),
        ),
      ).thenAnswer(
        (_) => Future.value(
          left(
            LoginExecuteException(cause: 'fail'),
          ),
        ),
      );

      when(
        router.startHomePage(
          off: anyNamed('off'),
          parameters: anyNamed('parameters'),
        ),
      ).thenAnswer((_) => Future.value());

      final controller = LoginController(
        router: router,
        loginExecuteUseCase: loginExecuteUseCase,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
      );

      Get.put(controller);

      when(router.showSnackbarError(message: anyNamed('message'))).thenReturn(
        MockSnackbarController(),
      );

      await controller.onLogin();

      verify(
        router.showSnackbarError(
          message: anyNamed('message'),
        ),
      ).called(1);
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

      final controller = LoginController(
        router: router,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
        loginExecuteUseCase: loginExecuteUseCase,
      );

      when(router.showSnackbarError(message: anyNamed('message'))).thenReturn(
        MockSnackbarController(),
      );

      await controller.enableDarkTheme();
      verify(router.showSnackbarError(message: anyNamed('message'))).called(1);
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

      final controller = LoginController(
        router: router,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
        loginExecuteUseCase: loginExecuteUseCase,
      );

      await controller.enableDarkTheme();

      expect(controller.darkMode, true);
      expect(controller.assetLogo, assetsLogoWhite);
    });

    test('should be success run change dark theme but turn off', () async {
      when(
        homeEnableDarkModeUseCase.call(
          enable: anyNamed('enable'),
        ),
      ).thenAnswer(
        (_) => Future.value(
          right(false),
        ),
      );

      final controller = LoginController(
        router: router,
        homeEnableDarkModeUseCase: homeEnableDarkModeUseCase,
        loginExecuteUseCase: loginExecuteUseCase,
      );

      await controller.enableDarkTheme();

      expect(controller.darkMode, false);
      expect(controller.assetLogo, assetsLogo);
    });
  });
}
