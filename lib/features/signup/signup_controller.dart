import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/shared/global_actions.dart';
import 'package:microblog/features/signup/data/signup_entity.dart';
import 'package:microblog/features/signup/data/signup_parameters.dart';
import 'package:microblog/features/signup/signup_execute_use_case.dart';

class SignupController extends BaseController<SignupParameters> {
  late final TextEditingController textUserController,
      textPasswordController,
      textPasswordConfirmController,
      textEmailController;

  final SignupExecuteUseCase signupExecuteUseCase;

  SignupController({
    required router,
    required this.signupExecuteUseCase,
  }) : super(router: router);

  @override
  void onInit() {
    textUserController = TextEditingController();
    textPasswordController = TextEditingController();
    textPasswordConfirmController = TextEditingController();
    textEmailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textUserController.dispose();
    textPasswordController.dispose();
    textEmailController.dispose();
    textPasswordConfirmController.dispose();
    super.onClose();
  }

  Future<void> onSignup() async {
    (await signupExecuteUseCase(
      data: SignupEntity(
        user: textUserController.text.trim(),
        email: textEmailController.text.trim(),
        password: textPasswordController.text.trim(),
      ),
    ))
        .fold(
      (l) => showSnackbarError(
        message: l.cause,
      ),
      (r) async {
        if (r.success) {
          await router.goBack();
          showSnackbarSuccess(message: 'signup_successful'.tr);
        }
      },
    );
  }
}
