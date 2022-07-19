import 'package:get/get.dart';
import 'package:microblog/features/home/home_binding.dart';
import 'package:microblog/features/home/home_page.dart';
import 'package:microblog/features/login/login_binding.dart';
import 'package:microblog/features/login/login_page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
