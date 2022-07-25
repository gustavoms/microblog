import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/features/home/home_binding.dart';
import 'package:microblog/features/home/home_controller.dart';

import '../feed/feed_controller_test.mocks.dart';

void main() {
  test('should be fine instantiated dependencies', () {
    Get.put(Storage());

    HomeBinding().dependencies();

    final controller = Get.find<HomeController>();

    expect(controller, isNotNull);

    Get.reset();
  });
}
