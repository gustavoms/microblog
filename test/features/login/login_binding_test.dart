import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/features/login/login_binding.dart';
import 'package:microblog/features/login/login_controller.dart';

void main() {
  test('should be fine instantiated dependencies', () {
    Get.put(Storage());

    LoginBinding().dependencies();

    final controller = Get.find<LoginController>();

    expect(controller, isNotNull);

    Get.reset();
  });
}
