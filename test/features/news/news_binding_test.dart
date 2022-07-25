import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/api.dart';
import 'package:microblog/features/news/news_binding.dart';
import 'package:microblog/features/news/news_controller.dart';

void main() {
  test('should be fine instantiated dependencies', () {
    Get.put(Api());

    NewsBinding().dependencies();

    final controller = Get.find<NewsController>();

    expect(controller, isNotNull);

    Get.reset();
  });
}
