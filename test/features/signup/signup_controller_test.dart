import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/signup/data/signup_response.dart';
import 'package:microblog/features/signup/signup_controller.dart';
import 'package:microblog/features/signup/signup_execute_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_controller_test.mocks.dart';

@GenerateMocks([
  SignupExecuteUseCase,
  IRouter,
  SnackbarController,
])
void main() {
  group('signup controller test cases', () {
    final mockSignupExecuteUseCase = MockSignupExecuteUseCase();
    final mockRouter = MockIRouter();
    final mockSnackbarController = MockSnackbarController();

    tearDown(() {
      Get.reset();
    });

    test('should be fine', () {
      final controller = SignupController(
        router: mockRouter,
        signupExecuteUseCase: mockSignupExecuteUseCase,
      );
      Get.put(controller);
      expect(controller, isA<SignupController>());
    });

    test('should be successful signup', () async {
      final controller = SignupController(
        router: mockRouter,
        signupExecuteUseCase: mockSignupExecuteUseCase,
      );

      Get.put(controller);

      when(
        mockRouter.goBack(
          canPop: anyNamed('canPop'),
          id: anyNamed('id'),
          result: anyNamed('result'),
          closeOverlays: anyNamed('closeOverlays'),
        ),
      ).thenAnswer(
        (_) => Future.value(),
      );

      when(mockRouter.showSnackbarSuccess(message: anyNamed('message')))
          .thenAnswer(
        (_) => MockSnackbarController(),
      );

      when(
        mockSignupExecuteUseCase.call(
          data: anyNamed('data'),
        ),
      ).thenAnswer(
        (_) => Future.value(
          right(
            SignupResponse(
              success: true,
            ),
          ),
        ),
      );

      await controller.onSignup();

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
