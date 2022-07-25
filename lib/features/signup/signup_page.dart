import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_page.dart';
import 'package:microblog/core/shared/widgets/custom_button.dart';
import 'package:microblog/core/shared/widgets/custom_text_form_field.dart';
import 'package:microblog/core/theme/app_theme.dart';
import 'package:microblog/features/signup/signup_controller.dart';

class SignupPage extends BasePage<SignupController> {
  SignupPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('signup_title'.tr),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(kDefPadding),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: 'hint_input_user'.tr,
                        textEditingController: controller.textUserController,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'input_error_empty_user'.tr;
                          }

                          return null;
                        },
                      ),
                      CustomTextFormField(
                        hintText: 'hint_input_email'.tr,
                        textEditingController: controller.textEmailController,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'input_error_empty_email'.tr;
                          }

                          if (!GetUtils.isEmail(value ?? '')) {
                            return 'input_error_invalid_email'.tr;
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

                          if (controller.textPasswordConfirmController.text !=
                              value) {
                            return 'input_error_password_not_match'.tr;
                          }

                          return null;
                        },
                        obscureText: true,
                      ),
                      CustomTextFormField(
                        hintText: 'hint_input_password_second'.tr,
                        textEditingController:
                            controller.textPasswordConfirmController,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'input_error_empty_password'.tr;
                          }

                          if (controller.textPasswordController.text != value) {
                            return 'input_error_password_not_match'.tr;
                          }

                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          if (_formKey.currentState!.validate()) {
                            controller.onSignup();
                          }
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
                                controller.onSignup();
                              }
                            },
                            text: 'text_btn_create'.tr,
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
    );
  }
}
