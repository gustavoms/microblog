import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:microblog/core/data/api.dart';
import 'package:microblog/core/data/storage.dart';

class GlobalBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    await GetStorage.init();

    Get.put<Api>(Api());
    Get.put<Storage>(Storage());
  }
}
