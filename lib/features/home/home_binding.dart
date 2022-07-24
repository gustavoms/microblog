import 'package:get/get.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/home/home_controller.dart';
import 'package:microblog/features/home/home_enable_dark_mode_use_case.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        router: RouterImpl(),
        storage: Get.find(),
        homeEnableDarkModeUseCase: HomeEnableDarkModeUseCase(
          storage: Get.find(),
        ),
      ),
    );
  }
}
