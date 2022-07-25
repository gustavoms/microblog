import 'package:get/get.dart';
import 'package:microblog/core/router/router.dart';

abstract class BaseController<TParams> extends GetxController {
  TParams? get parameters => Get.arguments;

  final IRouter router;
  BaseController({
    required this.router,
  });

  final _loading = false.obs;
  set loading(value) => _loading.value = value;
  get loading => _loading.value;
}
