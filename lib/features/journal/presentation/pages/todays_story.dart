import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/helpers/sizes.dart';
import '../../../../core/router/router_config.dart';
import '../../../utils/presentation/getx/controllers/utils_controller.dart';
import '../getx/controllers/journal_controller.dart';
import '../widgets/each_day_story_widget.dart';

class TodaysStory extends StatefulWidget {
  const TodaysStory({super.key});

  @override
  State<TodaysStory> createState() => _TodaysStoryState();
}

class _TodaysStoryState extends State<TodaysStory> {
  final UtitlityController utitlityController = Get.find<UtitlityController>();
  final JournalController journalController = Get.find<JournalController>();
  final ScrollController scrollController = ScrollController();
  late String id, title;
  double width = ScreenUtil().screenWidth;
  double height = ScreenUtil().screenHeight;
  bool mainScrolled = false;
  bool hideSvg = false;

  List<Object> stories = [];

  @override
  void initState() {
    title = Get.arguments['title'];
    id = Get.arguments['id'];
    scrollController.addListener(() {
      if (scrollController.offset > height * .05) {
        setState(() {
          hideSvg = true;
        });
      } else {
        setState(() {
          hideSvg = false;
        });
      }

      if (scrollController.offset > height * .15) {
        setState(() {
          mainScrolled = true;
        });
      } else {
        setState(() {
          mainScrolled = false;
        });
      }
    });
    journalController.getJournalTopicDays(id);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              title: mainScrolled
                  ? FittedBox(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    )
                  : null,
              flexibleSpace: Container(
                padding: !mainScrolled
                    ? EdgeInsets.symmetric(vertical: 20.h, horizontal: 10)
                    : null,
                child: mainScrolled
                    ? const SizedBox()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          hideSvg
                              ? const SizedBox()
                              : SizedBox(
                                  height: height * .1,
                                  child: SvgPicture.asset(
                                    AppAssets.writeSvg,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                          hideSvg ? const SizedBox() : SizedBox(height: 20.h),
                          Text(
                            '${'stories'.tr} ${'on'.tr}'.capitalize.toString(),
                            style: Theme.of(context).textTheme.headlineMedium,
                            overflow: TextOverflow.fade,
                          ),
                          FittedBox(
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.headlineMedium,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
              ),
              expandedHeight: height * .3,
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                  left: AppSizes.bodyPadding,
                  right: AppSizes.bodyPadding,
                  top: 10),
              sliver: Obx(
                () => journalController.journalDayValues.isEmpty
                    ? SliverList(
                        delegate: SliverChildListDelegate(
                          [
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
                        ),
                      )
                    : SliverList.builder(
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
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => journalController.moveToCreate(id),
        child: const Icon(CupertinoIcons.pencil_outline),
      ),
    );
  }
}
