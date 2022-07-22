import 'package:get/get.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/feed/feed_controller.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(
      () => FeedController(
        router: RouterImpl(),
      ),
    );
  }
}
