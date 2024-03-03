import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/app_handler.dart';
import '../getx/controllers/utils_controller.dart';
import '../../../../core/themes/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UtitlityController utitlityController = Get.find<UtitlityController>();
  @override
  void initState() {
    languageSetter();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        utitlityController.nextScreen();
      },
    );
    super.initState();
  }

  void languageSetter() async {
    final AppHandler appHandler = AppHandler();

    String? getLanguage = await appHandler.getLanguage();
    if (getLanguage != null) {
      if (getLanguage == 'english') {
        utitlityController.changeLanguage(const Locale('en', 'US'), 'english');
      } else {
        utitlityController.changeLanguage(const Locale('fr', 'FR'), 'french');
      }
    } else {
      utitlityController.changeLanguage(const Locale('en', 'US'), 'english');
    }

    String? getTheme = await appHandler.getTheme();
    if (getTheme != null) {
      if (getTheme == 'light') {
        utitlityController.themeMode.value = ThemeMode.light;
      } else if (getTheme == 'dark') {
        utitlityController.themeMode.value = ThemeMode.dark;
      } else {
        utitlityController.themeMode.value = ThemeMode.system;
      }
    } else {
      utitlityController.themeMode.value = ThemeMode.light;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = ScreenUtil().screenWidth;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: SizedBox(
          width: width * .5,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
