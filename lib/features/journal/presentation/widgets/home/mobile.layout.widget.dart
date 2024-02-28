import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/sizes.dart';
import '../../../../../core/router/router_config.dart';
import '../../getx/controllers/home_controller.dart';
import '../../getx/controllers/journal_controller.dart';
import '../create_journal_title.dart';
import '../journal_title_widget.dart';

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
              height: height,
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
                              arguments: {'id': eachJournal.id, 'title': eachJournal.title},
                            ),
                          );
                        },
                      ).animate().fade(),
              ),
            ),
          ),
          Positioned(
            bottom: height * .06,
            right: 15,
            child: FloatingActionButton(
              onPressed: () {
                Get.bottomSheet(
                  createJournalTitle(context, width),
                );
              },
              child: const Icon(CupertinoIcons.add),
            ),
          ),
        ],
      ),
    );
  }
}
