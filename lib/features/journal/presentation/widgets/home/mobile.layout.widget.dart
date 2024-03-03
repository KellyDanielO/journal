import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/sizes.dart';
import '../../../../../core/router/router_config.dart';
import '../../getx/controllers/home_controller.dart';
import '../../getx/controllers/journal_controller.dart';
import '../create_journal_title.dart';
import '../journal_title_widget.dart';
import '../mobile_settings_bottomsheet.dart';

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
            child: Container(
              width: width,
              height: height * .85,
              // color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
              child: Obx(
                () => journalController.journalTopicValues.isEmpty
                    ? SizedBox(
                        width: width * .3,
                        child: SvgPicture.asset(
                          AppAssets.emptySvg,
                          fit: BoxFit.fitWidth,
                        ),
                      ).animate().fade()
                    : ListView.builder(
                        itemCount: journalController.journalTopicValues.length,
                        itemBuilder: (context, index) {
                          final eachJournal =
                              journalController.journalTopicValues[index];
                          return JournalTitleWidget(
                            title: eachJournal.title,
                            width: width,
                            date: eachJournal.date,
                            journal: eachJournal,
                            onTap: () => Get.toNamed(
                              AppRouter.todaysStoryScreen,
                              arguments: {
                                'id': eachJournal.id,
                                'title': eachJournal.title
                              },
                            ),
                          );
                        },
                      ).animate().fade(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRouter.homeScreen);
                    },
                    icon: Column(
                      children: [
                        HeroIcon(
                          HeroIcons.home,
                          size: AppSizes.normalIconSize,
                          style: HeroIconStyle.solid,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'home'.tr.capitalize.toString(),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
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
                      Get.bottomSheet(MobileSettingsPanel(width: width));
                    },
                    icon: Column(
                      children: [
                        HeroIcon(
                          HeroIcons.cog6Tooth,
                          size: AppSizes.normalIconSize,
                          style: HeroIconStyle.outline,
                          color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(.5),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'settings'.tr.capitalize.toString(),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(.5),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
