import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/features/signup/signup_binding.dart';
import 'package:microblog/features/signup/signup_controller.dart';

void main() {
  test('should be fine instantiated dependencies', () {
    SignupBinding().dependencies();

    final controller = Get.find<SignupController>();

    expect(controller, isNotNull);

    Get.reset();
  });
}
