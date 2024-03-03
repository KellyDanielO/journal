import 'dart:ui' as ui;
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:in_app_update/in_app_update.dart';
import 'package:intl/intl.dart';

bool isTablet() {
  final double screenWidth =
      ui.window.physicalSize.width / ui.window.devicePixelRatio;
  final double screenHeight =
      ui.window.physicalSize.height / ui.window.devicePixelRatio;

  final double diagonalSize = 0.5 * (screenWidth + screenHeight);

  return diagonalSize >= 800;
}

// Future<bool> checkForUpdate() async {
//   if (!GetPlatform.isLinux) {
//     AppUpdateInfo check = await InAppUpdate.checkForUpdate();
//     if (check.updateAvailability == UpdateAvailability.updateAvailable) {
//       return true;
//     } else {
//       return false;
//     }
//   } else {
//     return false;
//   }
// }

String getCurrentLocale(BuildContext context) {
  // You can also use Localizations.localeOf(context) to get the current locale
  return Localizations.localeOf(context).toString();
}

String regularDateFormat(
  DateTime dateTime,
  String currentLocale,
) {
  DateTime currentDate = DateTime.now();
  String formattedDate;
  if (currentDate.year > dateTime.year) {
    formattedDate = DateFormat.yMMMMEEEEd(currentLocale).format(currentDate);
  } else {
    formattedDate = DateFormat.MMMMEEEEd(currentLocale).format(currentDate);
  }

  return formattedDate;
}
