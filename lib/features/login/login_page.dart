import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_page.dart';
import 'package:microblog/core/shared/assets_const.dart';
import 'package:microblog/core/shared/widgets/custom_button.dart';
import 'package:microblog/core/shared/widgets/custom_text_form_field.dart';
import 'package:microblog/core/theme/app_theme.dart';
import 'package:microblog/features/login/login_controller.dart';

class LoginPage extends BasePage<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(kDefPadding),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(kDefPadding),
                      child: Column(
                        children: [
                          Obx(
                            () => Image.asset(
                              controller.assetLogo,
                            ),
                          ),
                          CustomTextFormField(
                            hintText: 'hint_input_user'.tr,
                            textEditingController:
                                controller.textUserController,
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return 'input_error_empty_user'.tr;
                              }

                              return null;
                            },
                          ),
                          CustomTextFormField(
                            hintText: 'hint_input_password'.tr,
                            textEditingController:
                                controller.textPasswordController,
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return 'input_error_empty_password'.tr;
                              }

                              return null;
                            },
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kDefPadding),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.onLogin();
                                  }
                                },
                                text: 'text_btn_login'.tr,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton.outlined(
                                onPressed: () => controller.onSignup(),
                                text: 'text_btn_signup'.tr,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
