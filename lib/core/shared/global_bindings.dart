import 'package:get/get.dart';
import 'package:microblog/core/data/api.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Api>(Api());
  }
}
