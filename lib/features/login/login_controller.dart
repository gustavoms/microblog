import 'package:flutter/cupertino.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/shared/global_actions.dart';
import 'package:microblog/features/home/home_enable_dark_mode_use_case.dart';
import 'package:microblog/features/login/data/login_entity.dart';
import 'package:microblog/features/login/login_execute_use_case.dart';
import 'package:microblog/features/login/data/login_parameters.dart';

class LoginController extends BaseController<LoginParameters> {
  late final TextEditingController textUserController, textPasswordController;

  final LoginExecuteUseCase loginExecuteUseCase;
  final HomeEnableDarkModeUseCase homeEnableDarkModeUseCase;

  LoginController({
    required router,
    required this.loginExecuteUseCase,
    required this.homeEnableDarkModeUseCase,
  }) : super(router: router);

  @override
  void onInit() {
    textUserController = TextEditingController();
    textPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textUserController.dispose();
    textPasswordController.dispose();
    super.onClose();
  }

  @override
  onReady() async {
    await homeEnableDarkModeUseCase();
    super.onReady();
  }

  Future<void> onLogin() async {
    (await loginExecuteUseCase(
      data: LoginEntity(
        user: textUserController.text.trim(),
        password: textPasswordController.text.trim(),
      ),
    ))
        .fold(
      (l) => showSnackbarError(
        message: l.cause,
      ),
      (r) async {
        if (r.success) {
          await router.startHomePage(
            off: true,
          );
        }
      },
    );
  }

  Future<void> onSignup() async {
    await router.startSignupPage();
  }
}
