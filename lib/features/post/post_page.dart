import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_page.dart';
import 'package:microblog/core/shared/widgets/custom_button.dart';
import 'package:microblog/core/shared/widgets/custom_text_form_field.dart';
import 'package:microblog/core/theme/app_theme.dart';
import 'package:microblog/features/post/post_controller.dart';

class PostPage extends BasePage<PostController> {
  PostPage({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('post_title'.tr),
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
                        keyboardType: TextInputType.multiline,
                        maxLength: 280,
                        minLines: 5,
                        hintText: 'hint_post_message'.tr,
                        textEditingController: controller.textPostController,
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'input_error_empty_post_message'.tr;
                          }

                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          if (_formKey.currentState!.validate()) {
                            (controller.parameters?.isEditing ?? false)
                                ? controller.updatePost()
                                : controller.createPost();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefPadding),
                child: Column(
                  children: [
                    Visibility(
                      visible: (controller.parameters?.isEditing ?? false),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              color: Colors.red,
                              onPressed: () {
                                controller.deletePost();
                              },
                              text: 'text_btn_delete'.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                (controller.parameters?.isEditing ?? false)
                                    ? controller.updatePost()
                                    : controller.createPost();
                              }
                            },
                            text: (controller.parameters?.isEditing ?? false)
                                ? 'text_btn_update'.tr
                                : 'text_btn_create'.tr,
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
