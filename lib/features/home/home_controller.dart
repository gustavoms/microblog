import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/features/home/home_parameters.dart';

class HomeController extends BaseController<HomeParameters> {
  final _bottomNavigationIndex = 0.obs;
  set bottomNavigationIndex(value) => _bottomNavigationIndex.value = value;
  get bottomNavigationIndex => _bottomNavigationIndex.value;

  final _userName = ''.obs;
  set userName(value) => _userName.value = value;
  get userName => _userName.value;

  final _userEmail = ''.obs;
  set userEmail(value) => _userEmail.value = value;
  get userEmail => _userEmail.value;

  final Storage storage;

  HomeController({
    required router,
    required this.storage,
  }) : super(router: router);

  @override
  onReady() async {
    userName = await storage.getUserName();
    userEmail = await storage.getUserEmail();
    super.onReady();
  }

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
