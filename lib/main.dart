import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/router/pages.dart';
import 'package:microblog/core/shared/global_bindings.dart';
import 'package:microblog/core/theme/app_theme.dart';
import 'package:microblog/core/translations/text_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalBinding().dependencies();

  runApp(const MicroblogApp());
}

class MicroblogApp extends StatelessWidget {
  const MicroblogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.LOGIN,
        theme: appThemeData,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        translationsKeys: AppTranslation.translationsKeys,
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('pt', 'BR'),
      ),
    );
  }
}
