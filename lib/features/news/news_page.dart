import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_page.dart';
import 'package:microblog/core/theme/app_theme.dart';
import 'package:microblog/features/news/news_controller.dart';
import 'package:microblog/features/news/widgets/news_item.dart';

class NewsPage extends BasePage<NewsController> {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.reload,
      child: Padding(
        padding: const EdgeInsets.all(kDefPadding),
        child: Obx(
          () => ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, i) => const Divider(),
            itemBuilder: (context, i) {
              final item = controller.news[i];
              return NewsItem(item: item);
            },
            itemCount: controller.news.length,
          ),
        ),
      ),
    );
  }
}
