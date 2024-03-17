import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/helpers/sizes.dart';
import '../../getx/controllers/home_controller.dart';
import '../../getx/controllers/journal_controller.dart';
import '../create_journal_title.dart';
import '../mobile_settings_bottomsheet.dart';
import 'mobile.journal.widget.dart';
import 'mobile.saved.widget.dart';
import 'task.mobile.widget.dart';

class HomeMobileLayout extends GetView<HomeController> {
  HomeMobileLayout({super.key, required this.height, required this.width});

  final double height;
  final double width;

  final JournalController journalController = Get.find<JournalController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 0,
            child: SizedBox(
              width: width,
              height: height * .82,
              child: Obx(
                () => IndexedStack(
                  index: controller.currentTab.value,
                  children: [
                    MobileJournalWidget(
                      width: width,
                      height: height,
                      journalController: journalController,
                    ),
                    MobileTaskWidget(width: width, height: height),
                    const MobileSavedWidget(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: width,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        // Get.toNamed(AppRouter.homeScreen);
                        controller.currentTab.value = 0;
                      },
                      icon: Column(
                        children: [
                          HeroIcon(
                            HeroIcons.home,
                            size: AppSizes.normalIconSize,
                            style: controller.currentTab.value == 0
                                ? HeroIconStyle.solid
                                : HeroIconStyle.outline,
                            color: controller.currentTab.value == 0
                                ? Theme.of(context).textTheme.bodyMedium!.color
                                : Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!
                                    .withOpacity(.5),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'home'.tr.capitalize.toString(),
                            style: controller.currentTab.value == 0
                                ? Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color!
                                          .withOpacity(.5),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Get.toNamed(AppRouter.homeScreen);
                        controller.currentTab.value = 1;
                      },
                      icon: Column(
                        children: [
                          HeroIcon(
                            HeroIcons.checkBadge,
                            size: AppSizes.normalIconSize,
                            style: controller.currentTab.value == 1
                                ? HeroIconStyle.solid
                                : HeroIconStyle.outline,
                            color: controller.currentTab.value == 1
                                ? Theme.of(context).textTheme.bodyMedium!.color
                                : Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!
                                    .withOpacity(.5),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'task'.tr.capitalize.toString(),
                            style: controller.currentTab.value == 1
                                ? Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color!
                                          .withOpacity(.5),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.bottomSheet(
                          createJournalTitle(context, width),
                        );
                      },
                      icon: HeroIcon(
                        HeroIcons.plusCircle,
                        size: AppSizes.normalIconSize + 20.sp,
                        style: HeroIconStyle.solid,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Get.bottomSheet(MobileSettingsPanel(width: width));
                        controller.currentTab.value = 2;
                      },
                      icon: Column(
                        children: [
                          HeroIcon(
                            HeroIcons.bookmark,
                            size: AppSizes.normalIconSize,
                            style: controller.currentTab.value == 2
                                ? HeroIconStyle.solid
                                : HeroIconStyle.outline,
                            color: controller.currentTab.value == 2
                                ? Theme.of(context).textTheme.bodyMedium!.color
                                : Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!
                                    .withOpacity(.5),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'saved'.tr.capitalize.toString(),
                            style: controller.currentTab.value == 2
                                ? Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color!
                                          .withOpacity(.5),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.bottomSheet(MobileSettingsPanel(width: width));
                      },
                      icon: Column(
                        children: [
                          HeroIcon(
                            HeroIcons.cog6Tooth,
                            size: AppSizes.normalIconSize,
                            style: HeroIconStyle.outline,
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .color!
                                .withOpacity(.5),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'settings'.tr.capitalize.toString(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color!
                                          .withOpacity(.5),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
