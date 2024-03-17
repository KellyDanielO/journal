
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/sizes.dart';
import '../../../../../core/router/router_config.dart';
import '../../getx/controllers/journal_controller.dart';
import '../journal_title_widget.dart';

class MobileJournalWidget extends StatelessWidget {
  const MobileJournalWidget({
    super.key,
    required this.width,
    required this.height,
    required this.journalController,
  });

  final double width;
  final double height;
  final JournalController journalController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .85,
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
    );
  }
}
