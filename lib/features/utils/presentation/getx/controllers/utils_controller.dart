import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/helpers/app_handler.dart';
import '../../../../../core/router/router_config.dart';

class UtitlityController extends GetxController {
  RxString gender = 'male'.obs;
  Rx<Locale> currentLocale = const Locale('en', 'US').obs;

  final AppHandler appHandler = AppHandler();
  String titleType() {
    if (gender.value == 'male') {
      return "${'my'.tr.capitalize} ${'journal'.tr.capitalize}";
    } else if (gender.value == 'female') {
      return "${'my'.tr.capitalize} ${'diary'.tr.capitalize}";
    } else {
      return "${'my'.tr.capitalize} ${'record'.tr.capitalize}";
    }
  }

  void nextScreen() async {
    String? getGender = await appHandler.getGender();
    if (getGender == null) {
      Get.offAllNamed(AppRouter.genderSelectScreen);
    } else {
      gender.value = getGender;
      Get.offAllNamed(AppRouter.homeScreen);
    }
  }

  void setGender(String genderV) {
    gender.value = genderV;
    appHandler.saveGender(genderV);
  }

  void changeLanguage(Locale locale, String lang) {
    appHandler.saveLanguage(lang);
    Get.updateLocale(locale);
  }
}
