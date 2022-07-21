import 'package:get/get.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        router: RouterImpl(),
      ),
    );
  }
}
