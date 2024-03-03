import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/sizes.dart';
import '../../../../core/themes/colors.dart';
import '../../../utils/presentation/getx/controllers/utils_controller.dart';

class TabletSettingsPanel extends StatefulWidget {
  final double width;
  const TabletSettingsPanel({super.key, required this.width});

  @override
  State<TabletSettingsPanel> createState() => _TabletSettingsPanelState();
}

class _TabletSettingsPanelState extends State<TabletSettingsPanel> {
  final UtitlityController controller = Get.find<UtitlityController>();
  late Color textColor, backgroundColor;

  @override
  void didChangeDependencies() {
    setColors();
    super.didChangeDependencies();
  }

  void setColors() {
    if (controller.themeMode.value == ThemeMode.system) {
      if (Theme.of(context).scaffoldBackgroundColor ==
          AppColors.blackBackground) {
        // Dark theme
        textColor = AppColors.whiteColor;
        backgroundColor = AppColors.blackBackground;
      } else {
        // light theme
        textColor = AppColors.blackColor;
        backgroundColor = AppColors.whiteBackground;
      }
    } else if (controller.themeMode.value == ThemeMode.light) {
      // light theme
      textColor = AppColors.blackColor;
      backgroundColor = AppColors.whiteBackground;
    } else {
      // dark theme
      textColor = AppColors.whiteColor;
      backgroundColor = AppColors.blackBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: widget.width * .35,
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.normalPadding,
          horizontal: AppSizes.normalPadding,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 25.w,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'settings'.tr.capitalize.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: textColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'change_language'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: textColor),
            ),
            SizedBox(height: 10.h),
            Obx(
              () => Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'english'.tr.capitalize.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: textColor),
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
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: textColor),
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
            ),
            SizedBox(height: 15.h),
            Text(
              'theme'.tr.capitalize.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: textColor),
            ),
            SizedBox(height: 10.h),
            Obx(
              () => Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'light'.tr.capitalize.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: textColor),
                    ),
                    leading: Radio<ThemeMode>(
                      value: ThemeMode.light,
                      groupValue: controller.themeMode.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.themeMode.value = value;
                          setState(() => setColors());
                          controller.setTheme('light');
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'dark'.tr.capitalize.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: textColor),
                    ),
                    leading: Radio<ThemeMode>(
                      value: ThemeMode.dark,
                      groupValue: controller.themeMode.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.themeMode.value = value;
                          setState(() => setColors());
                          controller.setTheme('dark');
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'system'.tr.capitalize.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: textColor),
                    ),
                    leading: Radio<ThemeMode>(
                      value: ThemeMode.system,
                      groupValue: controller.themeMode.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.themeMode.value = value;
                          setState(() => setColors());
                          controller.setTheme('system');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
