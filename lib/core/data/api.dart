import 'package:get/get.dart';

class Api extends GetConnect {
  @override
  void onInit() {
    baseUrl = 'https://gb-mobile-app-teste.s3.amazonaws.com';
    super.onInit();
  }
}
