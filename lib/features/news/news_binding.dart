import 'package:get/get.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/news/news_controller.dart';
import 'package:microblog/features/news/news_find_all_use_case.dart';
import 'package:microblog/features/news/news_repository.dart';

class NewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(
      () => NewsController(
        router: RouterImpl(),
        newsFindAllUseCase: NewsFindAllUseCase(
          repository: NewsRepository(
            api: Get.find(),
          ),
        ),
      ),
    );
  }
}
