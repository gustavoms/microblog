import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/features/login/login_parameters.dart';

class LoginController extends BaseController<LoginParameters> {
  late final TextEditingController textUserController, textPasswordController;

  LoginController({
    required router,
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

  Future<void> onLogin() async {
    await router.startHomePage(
      off: true,
    );
  }

  Future<void> onSignup() async {
    await router.startSignupPage();
  }
}
