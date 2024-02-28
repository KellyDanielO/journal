import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/sizes.dart';
import '../../getx/controllers/home_controller.dart';
import '../../getx/controllers/journal_controller.dart';
import '../create_journal_title_tablet.dart';
import '../journal_title_widget.dart';
import '../tablet/tablet_todays_story.dart';

class HomeTabletLayout extends GetView<HomeController> {
  HomeTabletLayout({super.key, required this.height, required this.width});

  final double height;
  final double width;

  final JournalController journalController = Get.find<JournalController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: width,
              height: height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: width * .4,
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding,),
                    child: Obx(
                      () => journalController.journalTopicValues.isEmpty
                          ? SizedBox(
                              width: width * .5,
                              child: SvgPicture.asset(
                                AppAssets.emptySvg,
                                fit: BoxFit.contain,
                              ),
                            ).animate().fade()
                          : ListView.builder(
                              itemCount:
                                  journalController.journalTopicValues.length,
                              itemBuilder: (context, index) {
                                final eachJournal =
                                    journalController.journalTopicValues[index];
                                return JournalTitleWidget(
                                  title: eachJournal.title,
                                  width: width,
                                  date: eachJournal.date,
                                  journal: eachJournal,
                                  onTap: () {
                                    journalController
                                        .getJournalTopicDays(eachJournal.id);
                                    journalController.tabSelected.value = true;
                                    journalController.selectedId.value =
                                        eachJournal.id;
                                    journalController.seleectedTitle.value =
                                        eachJournal.title;
                                  },
                                );
                              },
                            ).marginOnly(bottom: 70.h).animate().fade(),
                    ),
                  ),
                  Obx(
                    () => journalController.tabSelected.value
                        ? SizedBox(
                            width: width * .45,
                            child: TabletTodaysStory(
                              width: width,
                              height: height,
                              id: journalController.selectedId.value,
                              title: journalController.seleectedTitle.value,
                            ),
                          ).animate().fade()
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: height * .06,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    insetPadding: const EdgeInsets.all(0),
                    contentPadding: const EdgeInsets.all(0),
                    backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    content: createJournalTitleTablet(context, width),
                  ),
                );
              },
              child: const Icon(CupertinoIcons.add),
            ),
          ),
        ],
      ).marginOnly(top: 10),
    );
  }
}
