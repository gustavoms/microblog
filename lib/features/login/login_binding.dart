import 'package:get/get.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        router: RouterImpl(),
      ),
    );
  }
}
