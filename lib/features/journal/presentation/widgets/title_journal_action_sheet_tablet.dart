import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/sizes.dart';
import '../../../../core/themes/colors.dart';
import '../../domain/entities/journal_day.dart';
import '../../domain/entities/journal_topic.dart';
import '../getx/controllers/journal_controller.dart';

FittedBox titleJournalActionBottomSheetTablet(
  BuildContext context,
  double width, {
  String? type,
  JournalTopicEntity? journal,
  String? id,
  JournalDayEntity? journalDay,
}) {
  JournalController journalController = Get.find<JournalController>();
  return FittedBox(
    child: Container(
      width: width * .25,
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.normalPadding - 10,
        horizontal: AppSizes.normalPadding - 10,
      ),
      decoration:  BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 10.w,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(height: 10.h),
          Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  if (journal != null && type != 'each_day') {
                    journalController.deleteJournalTitle(journal);
                  } else {
                    if (id != null && journalDay != null) {
                      journalController.deleteJournalDay(id, journalDay);
                    }
                  }
                },
                leading: Icon(
                  Icons.delete,
                  size: AppSizes.normalIconSize,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
                title: Text(
                  'delete'.tr.capitalize.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
