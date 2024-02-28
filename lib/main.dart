import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:journal/core/helpers/sizes.dart';
import 'package:path_provider/path_provider.dart';

import 'core/helpers/functions.dart';
import 'core/router/router_config.dart';
import 'core/themes/colors.dart';
import 'core/translations/translations.dart';
import 'features/journal/data/models/journal_day_model.dart';
import 'features/journal/data/models/journal_day_title_wrapper.dart';
import 'features/journal/data/models/journal_topic_model.dart';
import 'features/journal/data/models/journal_topic_wrapper.dart';
import 'features/utils/presentation/getx/bindings/utils_controller_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(JournalTopicModelAdapter());
  Hive.registerAdapter(JournalTopicWrapperAdapter());
  await Hive.openBox<JournalTopicWrapper>('journalTopics');
  Hive.registerAdapter(JournalDayModelAdapter());
  Hive.registerAdapter(JournalTopicDayWrapperAdapter());
  await Hive.openBox<JournalTopicDayWrapper>('journalTopicDaysWrapper');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Today\'s Journal',
          translations: Langauages(),
          locale: const Locale('en', 'US'),
          initialBinding: UtilsPageBinding(),
          fallbackLocale: const Locale('en', 'US'),
          darkTheme: ThemeData(
            fontFamily: 'Poppins',
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
            textTheme: TextTheme(
              headlineLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
              headlineMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isTablet() ? 5.sp : 18.sp,
                color: AppColors.whiteColor,
              ),
              headlineSmall: TextStyle(
                fontSize: isTablet() ? 4.sp : 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor,
              ),
              bodyMedium: TextStyle(
                fontSize: AppSizes.normalSize,
                color: AppColors.whiteColor,
              ),
              bodySmall: const TextStyle(
                color: AppColors.whiteColor,
              ),
              labelSmall: const TextStyle(
                backgroundColor: AppColors.blackColor,
              ),
            ),
            iconTheme: IconThemeData(
              size: isTablet() ? 16.sp : 24.sp,
            ),
            appBarTheme: const AppBarTheme(
              scrolledUnderElevation: 0,
              backgroundColor: AppColors.blackColor,
              elevation: 0,
            ),
            scaffoldBackgroundColor: AppColors.blackBackground,
          ),
          themeMode: ThemeMode.system,
          theme: ThemeData(
            fontFamily: 'Poppins',
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
            textTheme: TextTheme(
              headlineLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
              headlineMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isTablet() ? 5.sp : 18.sp,
                color: AppColors.blackColor,
              ),
              headlineSmall: TextStyle(
                fontSize: isTablet() ? 4.sp : 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
              bodyMedium: TextStyle(
                fontSize: AppSizes.normalSize,
                color: AppColors.blackColor,
              ),
              bodySmall: const TextStyle(
                color: AppColors.blackColor,
              ),
              labelSmall: const TextStyle(
                backgroundColor: AppColors.whiteColor,
              ),
            ),
            iconTheme: IconThemeData(
              size: isTablet() ? 16.sp : 24.sp,
            ),
            appBarTheme: const AppBarTheme(
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: AppColors.whiteColor,
            ),
            scaffoldBackgroundColor: AppColors.whiteBackground,
          ),
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 500),
          getPages: AppRouter.pagesList,
        );
      },
    );
  }
}
