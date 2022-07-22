import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/features/home/home_parameters.dart';

class HomeController extends BaseController<HomeParameters> {
  final _bottomNavigationIndex = 0.obs;
  set bottomNavigationIndex(value) => _bottomNavigationIndex.value = value;
  get bottomNavigationIndex => _bottomNavigationIndex.value;

  HomeController({
    required router,
  }) : super(router: router);

  changePage(int index) async {
    if (index == bottomNavigationIndex) return;
    bottomNavigationIndex = index;
    switch (index) {
      case 0:
        await router.startFeed();
        break;
      case 1:
        await router.startNews();
        break;
      default:
        await router.startFeed();
        break;
    }
  }
}
