import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/router/router_config.dart';
import '../../../../core/themes/colors.dart';
import '../getx/controllers/utils_controller.dart';

class GenderSelectScreen extends GetView<UtitlityController> {
  const GenderSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = ScreenUtil().screenWidth;
    double height = ScreenUtil().screenHeight;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'configuration'.tr.capitalize.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'change_language'.tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 10.h),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'english'.tr.capitalize.toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    leading: Radio<Locale>(
                      value: const Locale('en', 'US'),
                      groupValue: controller.currentLocale.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.currentLocale.value = value;
                          controller.changeLanguage(value, 'english');
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'french'.tr.capitalize.toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    leading: Radio<Locale>(
                      value: const Locale('fr', 'FR'),
                      groupValue: controller.currentLocale.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.currentLocale.value = value;
                          controller.changeLanguage(value, 'french');
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              Text(
                'select_gender'.tr.capitalize.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 10.h),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'male'.tr.capitalize.toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    leading: Radio<String>(
                      value: 'male',
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value.toString();
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'female'.tr.capitalize.toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    leading: Radio<String>(
                      value: 'female',
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value.toString();
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'rather_not_say'.tr.capitalize.toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    leading: Radio<String>(
                      value: 'unknown',
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value.toString();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          controller.setGender(controller.gender.value);
          Get.toNamed(AppRouter.homeScreen);
        },
        child: const Icon(
          Icons.check,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
