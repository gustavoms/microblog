import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_page.dart';
import 'package:microblog/core/router/pages.dart';
import 'package:microblog/core/shared/assets_const.dart';
import 'package:microblog/features/feed/feed_binding.dart';
import 'package:microblog/features/feed/feed_page.dart';
import 'package:microblog/features/home/home_controller.dart';
import 'package:microblog/features/home/widgets/drawer_menu.dart';
import 'package:microblog/features/news/news_binding.dart';
import 'package:microblog/features/news/news_page.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          assetsLogoWhite,
          width: 210,
        ),
      ),
      drawer: Obx(
        () => HomeDrawer(
          userName: controller.userName,
          userEmail: controller.userEmail,
          onChangedDarkMode: (value) => controller.changeDarkMode(value),
          darkMode: controller.darkMode,
        ),
      ),
      body: Navigator(
        key: Get.nestedKey(Routes.KEY_NAVIGATION_HOME),
        initialRoute: Routes.FEED,
        onGenerateRoute: (settings) {
          if (settings.name == Routes.FEED) {
            return GetPageRoute(
              page: () => const FeedPage(),
              binding: FeedBinding(),
            );
          } else if (settings.name == Routes.NEWS) {
            return GetPageRoute(
              page: () => const NewsPage(),
              binding: NewsBinding(),
            );
          }
          return null;
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.bottomNavigationIndex,
          onTap: (index) => controller.changePage(index),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_rounded),
              label: 'bottom_navigation_feed_title'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.update_rounded),
              label: 'bottom_navigation_news_title'.tr,
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: controller.bottomNavigationIndex == 0
              ? FloatingActionButton(
                  onPressed: () => controller.startCreatePost(),
                  child: const Icon(Icons.add),
                )
              : null,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
