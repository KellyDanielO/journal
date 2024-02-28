import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/sizes.dart';
import '../../../../core/themes/colors.dart';
import '../getx/controllers/journal_controller.dart';

class CreateTodayStory extends GetView<JournalController> {
  const CreateTodayStory({super.key});

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
        centerTitle: true,
        title: FittedBox(
          child: Text(
            DateFormat.yMMMMEEEEd().format(DateTime.now()).toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
        child: TextField(
          autofocus: true,
          style: Theme.of(context).textTheme.headlineSmall,
          textInputAction: TextInputAction.newline,
          controller: controller.createInputController,
          maxLines: 500,
          onChanged: (value) {
            controller.typeCounter.value++;
          },
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: '${'todays_messages'.tr.capitalizeFirst}....',
            hintStyle: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.greyColor),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => controller.textFieldEmpty.value
            ? const SizedBox()
            : FloatingActionButton(
                onPressed: () {
                  Get.arguments['id'];
                  controller.createJournalDay(Get.arguments['id']);
                },
                child: const Icon(CupertinoIcons.check_mark),
              ).animate().scale(),
      ),
    );
  }
}
