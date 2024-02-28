import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/sizes.dart';
import '../../../../core/themes/colors.dart';
import '../getx/controllers/journal_controller.dart';

FittedBox createJournalTitle(BuildContext context, double width) {
  final JournalController journalController = Get.find<JournalController>();
  return FittedBox(
    child: Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.normalPadding,
        horizontal: AppSizes.normalPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.labelSmall!.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 50.w,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(height: 10.h),
          Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: journalController.createInputController,
                style: Theme.of(context).textTheme.headlineMedium,
                maxLength: 80,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'title_example'.tr.capitalize,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.greyColor),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: width * .6,
                child: FilledButton(
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 5),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    journalController.createJournalTitle();
                  },
                  child: Text(
                    'add'.tr.capitalize.toString(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
