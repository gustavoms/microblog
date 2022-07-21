import 'package:get/get.dart';
import 'package:microblog/core/router/router.dart';

abstract class BaseController<TParams> extends GetxController {
  late final TParams? parameters;
  final IRouter router;
  BaseController({
    required this.router,
  }) {
    parameters = Get.arguments;
  }
}
