import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:journal/core/helpers/sizes.dart';

import '../../../../core/helpers/functions.dart';
import '../../domain/entities/journal_topic.dart';
import 'title_journal_action_sheet.dart';
import 'title_journal_action_sheet_tablet.dart';

class JournalTitleWidget extends StatelessWidget {
  final String title;
  final String date;
  final double width;
  final JournalTopicEntity? journal;
  final Function()? onTap;
  const JournalTitleWidget({
    super.key,
    required this.title,
    required this.width,
    required this.date,
    this.onTap,
    this.journal,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onLongPress: isTablet()
            ? null
            : () {
                Get.bottomSheet(
                  titleJournalActionBottomSheet(context, width,
                      journal: journal),
                );
              },
        onTap: onTap,
        onDoubleTap: isTablet()
            ? () {
                Get.dialog(
                  AlertDialog(
                    insetPadding: const EdgeInsets.all(0),
                    contentPadding: const EdgeInsets.all(0),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    content: titleJournalActionBottomSheetTablet(context, width,
                        journal: journal),
                  ),
                );
              }
            : null,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.normalPadding,
            horizontal: AppSizes.normalPadding,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).textTheme.labelSmall!.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(bottom: 10),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.parse(date)).toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontStyle: FontStyle.italic),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}