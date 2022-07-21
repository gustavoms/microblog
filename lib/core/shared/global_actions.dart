import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackbarError({
  required String message,
}) {
  return Get.snackbar(
    'snackbar_error'.tr,
    message,
    icon: const Icon(
      Icons.error_outline_rounded,
      color: Colors.red,
    ),
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
  );
}

showSnackbarSuccess({
  required String message,
}) {
  return Get.snackbar(
    'snackbar_success'.tr,
    message,
    icon: const Icon(
      Icons.check_circle_outline_rounded,
      color: Colors.green,
    ),
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
  );
}
