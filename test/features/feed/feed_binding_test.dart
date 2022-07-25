import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/features/feed/feed_binding.dart';
import 'package:microblog/features/feed/feed_controller.dart';

import 'feed_controller_test.mocks.dart';

void main() {
  test('should be fine instantiated dependencies', () {
    Get.put(Storage());

    FeedBinding().dependencies();

    final controller = Get.find<FeedController>();

    expect(controller, isNotNull);

    Get.reset();
  });
}
