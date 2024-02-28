import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/sizes.dart';
import '../../../../core/themes/colors.dart';
import '../../domain/entities/journal_day.dart';
import '../getx/controllers/journal_controller.dart';

class EachDayMessage extends StatefulWidget {
  const EachDayMessage({super.key});

  @override
  State<EachDayMessage> createState() => _EachDayMessageState();
}

class _EachDayMessageState extends State<EachDayMessage> {
  final JournalController journalController = Get.find<JournalController>();
  late JournalDayEntity story;
  late String id;
  @override
  void initState() {
    journalController.createInputController.text = '';
    bool edit = Get.arguments['edit'] as bool;
    id = Get.arguments['id'] as String;
    story = Get.arguments['story'] as JournalDayEntity;
    journalController.editDayMode.value = edit;
    journalController.storyMessage.value = story.message;
    if (edit) {
      journalController.textFieldEditEmpty.value = true;
      journalController.editInputController.value.text = story.message;
      journalController.editDayMode.value = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = ScreenUtil().screenWidth;
    double height = ScreenUtil().screenHeight;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        title: FittedBox(
          child: Text(
            DateFormat.yMMMMEEEEd()
                .format(DateTime.parse(story.date))
                .toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          Obx(
            () => journalController.editDayMode.value
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      journalController.textFieldEditEmpty.value = true;
                      journalController.editInputController.value.text =
                          journalController.storyMessage.value;
                      journalController.editDayMode.value = true;
                    },
                    icon: HeroIcon(
                      HeroIcons.pencilSquare,
                      style: HeroIconStyle.outline,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      size: AppSizes.normalIconSize - 10,
                    ),
                  ),
          )
        ],
      ),
      body: Container(
        width: width,
        height: height,
        padding:
            EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding, vertical: 5),
        child: Obx(
          () => journalController.editDayMode.value
              ? TextField(
                  autofocus: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textInputAction: TextInputAction.newline,
                  controller: journalController.editInputController.value,
                  maxLines: 500,
                  onChanged: (value) {
                    journalController.typeCounterEdit.value++;
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: '${'todays_messages'.tr.capitalizeFirst}....',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.greyColor),
                  ),
                )
              : SelectableText(
                  journalController.storyMessage.value,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  maxLines: 100000000000000,
                ),
        ),
      ),
      floatingActionButton: Obx(
        () => journalController.textFieldEditEmpty.value
            ? const SizedBox()
            : journalController.editDayMode.value == false
                ? const SizedBox()
                : FloatingActionButton(
                    onPressed: () {
                      journalController.editJournalDay(id, story.date);
                      journalController.editDayMode.value = false;
                    },
                    child: const Icon(CupertinoIcons.check_mark),
                  ),
      ),
    );
  }
}
