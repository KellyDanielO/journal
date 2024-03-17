import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/presentation/getx/controllers/utils_controller.dart';
import '../getx/controllers/home_controller.dart';
import '../getx/controllers/journal_controller.dart';
import '../widgets/home/mobile.layout.widget.dart';
import '../widgets/home/tablet.layout.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.find<HomeController>();
  final UtitlityController utitlityController = Get.find<UtitlityController>();
  final JournalController journalController = Get.find<JournalController>();

  @override
  void initState() {
    journalController.getJournalTopicsValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = ScreenUtil().screenWidth;
    double height = ScreenUtil().screenHeight;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Obx(
          () => titleWidget(),
        ),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return HomeTabletLayout(height: height, width: width);
          }
          return HomeMobileLayout(height: height, width: width);
        }),
      ),
    );
  }

  Text titleWidget() {
    if (_homeController.currentTab.value == 1) {
      return Text(
        'task'.tr.capitalize.toString(),
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontFamily: 'Aclonica'),
      );
    } else if (_homeController.currentTab.value == 2) {
      return Text(
        'saved'.tr.capitalize.toString(),
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontFamily: 'Aclonica'),
      );
    } else {
      return Text(
        utitlityController.titleType(),
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontFamily: 'Aclonica'),
      );
    }
  }
}
