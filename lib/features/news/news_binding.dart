import 'package:get/get.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/news/news_controller.dart';

class NewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(
      () => NewsController(
        router: RouterImpl(),
      ),
    );
  }
}
