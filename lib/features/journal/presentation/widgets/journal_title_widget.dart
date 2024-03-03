
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
    // List<Color> colors = [
    //   const Color(0xFF596EFF),
    //   const Color(0xFFFC5A20),
    //   const Color(0xFFFC3165)
    // ];
    // Random random = Random();

    // int randomIndex = random.nextInt(colors.length);

    // Color randomColor = colors[randomIndex];
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
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(bottom: 10),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: isTablet() ? Theme.of(context).textTheme.headlineMedium : Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              SizedBox(height: 3.h),
              Text(
                regularDateFormat(
                    DateTime.parse(date), getCurrentLocale(context)),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
