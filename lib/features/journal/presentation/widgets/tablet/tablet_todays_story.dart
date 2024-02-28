import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';

import '../../../../../core/helpers/app_assets.dart';
import '../../../../../core/helpers/sizes.dart';
import '../../../../../core/router/router_config.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../utils/presentation/getx/controllers/utils_controller.dart';
import '../../getx/controllers/journal_controller.dart';
import '../each_day_story_widget.dart';

class TabletTodaysStory extends StatefulWidget {
  final double width;
  final double height;
  final String? id;
  final String? title;
  const TabletTodaysStory(
      {super.key,
      required this.width,
      required this.height,
      this.id,
      this.title});

  @override
  State<TabletTodaysStory> createState() => _TabletTodaysStoryState();
}

class _TabletTodaysStoryState extends State<TabletTodaysStory> {
  final UtitlityController utitlityController = Get.find<UtitlityController>();
  final JournalController journalController = Get.find<JournalController>();
  final ScrollController scrollController = ScrollController();
  late String id, title;
  bool mainScrolled = false;
  bool hideSvg = false;

  List<Object> stories = [];

  @override
  void initState() {
    title = widget.title.toString();
    id = widget.id.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.width;
    double height = widget.height;
    return Container(
      width: width,
      height: height * .95,
      margin: EdgeInsets.only(bottom: height * .1),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).textTheme.labelSmall!.backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration:  BoxDecoration(
            color: Theme.of(context).textTheme.labelSmall!.backgroundColor,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        journalController.tabSelected.value = false;
                        journalController.selectedId.value = '';
                        journalController.seleectedTitle.value = '';
                      },
                      padding: const EdgeInsets.all(5),
                      icon: Icon(
                        CupertinoIcons.arrow_left,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        size: AppSizes.normalIconSize - 10,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Obx(
                      () => Text(
                        journalController.seleectedTitle.value,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                IconButton.filled(
                  onPressed: () => journalController.moveToCreate(journalController.selectedId.value),
                  padding: const EdgeInsets.all(5),
                  icon: HeroIcon(
                    HeroIcons.pencil,
                    style: HeroIconStyle.outline,
                    color: AppColors.whiteColor,
                    size: AppSizes.normalIconSize - 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => journalController.journalDayValues.isEmpty
                  ? Column(
                      children: [
                        SizedBox(height: 50.h),
                        SizedBox(
                          width: width * .1,
                          height: height * .3,
                          child: SvgPicture.asset(
                            AppAssets.emptySvg,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'empty'.tr.capitalize.toString(),
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                  : ListView.builder(
                      itemCount: journalController.journalDayValues.length,
                      itemBuilder: (context, index) {
                        final m = journalController.journalDayValues[index];
                        return EachDayStory(
                          title: DateFormat.yMMMMEEEEd()
                              .format(DateTime.parse(m.date))
                              .toString(),
                          width: width,
                          message: m.message,
                          id: id,
                          journalDay: m,
                          onTap: () => Get.toNamed(
                            AppRouter.eachDay,
                            arguments: {'story': m, 'edit': false, 'id': id},
                          ),
                        );
                      },
                    ).marginOnly(bottom: 70.h),
            ),
          ),
        ],
      ),
    );
  }
}