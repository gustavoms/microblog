import 'package:get/get.dart';

abstract class BaseController<TParams> extends GetxController {
  late final TParams parameters;

  BaseController() {
    parameters = Get.arguments;
  }
}
