import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/features/post/post_binding.dart';
import 'package:microblog/features/post/post_controller.dart';

void main() {
  test('should be fine instantiated dependencies', () async {
    Get.put(Storage());

    PostBinding().dependencies();

    final controller = Get.find<PostController>();

    expect(controller, isNotNull);

    Get.reset();
  });
}
