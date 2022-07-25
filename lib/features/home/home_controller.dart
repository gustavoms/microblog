import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/features/home/home_enable_dark_mode_use_case.dart';
import 'package:microblog/features/home/home_parameters.dart';
import 'package:microblog/features/post/data/post_parameters.dart';

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

  final _darkMode = false.obs;
  set darkMode(value) => _darkMode.value = value;
  get darkMode => _darkMode.value;

  final IStorage storage;

  final HomeEnableDarkModeUseCase homeEnableDarkModeUseCase;

  HomeController({
    required router,
    required this.storage,
    required this.homeEnableDarkModeUseCase,
  }) : super(router: router);

  @override
  onReady() async {
    userName = await storage.getUserName();
    userEmail = await storage.getUserEmail();
    darkMode = parameters?.darkMode ?? false;
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

  changeDarkMode(value) async {
    (await homeEnableDarkModeUseCase(
      enable: value,
    ))
        .fold(
      (l) => router.showSnackbarError(message: l.cause),
      (r) => {
        darkMode = r,
      },
    );
  }

  Future<void> startCreatePost() async {
    await router.startPostPage(
      parameters: PostParameters(),
    );
  }
}
