import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_page.dart';
import 'package:microblog/features/feed/feed_controller.dart';

class FeedPage extends BasePage<FeedController> {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemBuilder: (context, i) {
          final item = controller.feedPosts[i];
          return Card(
            child: Column(
              children: [
                Text(
                  item.message,
                ),
              ],
            ),
          );
        },
        itemCount: controller.feedPosts.length,
      ),
    );
  }
}
