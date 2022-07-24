import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_page.dart';
import 'package:microblog/features/feed/feed_controller.dart';
import 'package:microblog/features/feed/widget/feed_item.dart';

class FeedPage extends BasePage<FeedController> {
  const FeedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.reload,
      child: Obx(
        () => controller.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  final item = controller.feedPosts[i];
                  return FeedItem(
                    item: item,
                    currentUserId: controller.currentUserId,
                  );
                },
                itemCount: controller.feedPosts.length,
              ),
      ),
    );
  }
}
