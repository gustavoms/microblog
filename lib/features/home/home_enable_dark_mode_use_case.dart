import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/theme/app_theme.dart';
import 'package:microblog/features/home/exceptions/home_enable_dark_mode_exception.dart';

class HomeEnableDarkModeUseCase {
  final IStorage storage;

  HomeEnableDarkModeUseCase({
    required this.storage,
  });

  Future<Either<HomeEnableDarkModeException, bool>> call({
    bool? enable,
  }) async {
    try {
      if (enable != null) {
        await storage.setDarkMode(enable);
      }

      final darkMode = await storage.isDarkMode();

      if (darkMode) {
        Get.changeTheme(ThemeData.dark());
        return right(true);
      }

      Get.changeTheme(appThemeData);
      return right(false);
    } on Exception catch (e) {
      return Left(
        HomeEnableDarkModeException(
          cause: e.toString(),
        ),
      );
    }
  }
}
