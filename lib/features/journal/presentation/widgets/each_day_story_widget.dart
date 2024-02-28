import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:journal/core/helpers/sizes.dart';

import '../../../../core/helpers/functions.dart';
import '../../domain/entities/journal_day.dart';
import 'title_journal_action_sheet.dart';
import 'title_journal_action_sheet_tablet.dart';

class EachDayStory extends StatelessWidget {
  final String title;
  final String message;
  final double width;
  final String? id;
  final JournalDayEntity? journalDay;
  final Function()? onTap;
  const EachDayStory({
    super.key,
    required this.title,
    required this.width,
    this.onTap,
    required this.message,
    this.id,
    this.journalDay,
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
                      type: 'each_day', id: id, journalDay: journalDay),
                );
              },
        onDoubleTap: isTablet()
            ? () {
                Get.dialog(
                  AlertDialog(
                    insetPadding: const EdgeInsets.all(0),
                    contentPadding: const EdgeInsets.all(0),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    content: titleJournalActionBottomSheetTablet(context, width,
                        type: 'each_day', id: id, journalDay: journalDay),
                  ),
                );
              }
            : null,
        onTap: onTap,
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
                message,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontStyle: FontStyle.italic),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
