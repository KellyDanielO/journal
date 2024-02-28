import 'package:get/get.dart';

import '../../features/journal/presentation/getx/bindings/home_binding_controller.dart';
import '../../features/journal/presentation/pages/create_todays_story.dart';
import '../../features/journal/presentation/pages/each_day_message.dart';
import '../../features/journal/presentation/pages/home.dart';
import '../../features/journal/presentation/pages/todays_story.dart';
import '../../features/utils/presentation/getx/bindings/utils_controller_bindings.dart';
import '../../features/utils/presentation/pages/gender_select.dart';
import '../../features/utils/presentation/pages/splash.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String homeScreen = '/home';
  static const String genderSelectScreen = '/gender';
  static const String todaysStoryScreen = '/todaystory';
  static const String eachDay = '/eachDay';
  static const String createStory = '/create-story';

  static List<GetPage> pagesList = [
    GetPage(
      name: splashScreen,
      binding: UtilsPageBinding(),
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: homeScreen,
      bindings: [
        JournalBindings(),
        UtilsPageBinding(),
      ],
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: genderSelectScreen,
      binding: UtilsPageBinding(),
      page: () => const GenderSelectScreen(),
    ),
    GetPage(
      name: todaysStoryScreen,
      bindings: [
        JournalBindings(),
        UtilsPageBinding(),
      ],
      page: () => const TodaysStory(),
    ),
    GetPage(
      name: eachDay,
      bindings: [
        JournalBindings(),
        UtilsPageBinding(),
      ],
      page: () => const EachDayMessage(),
    ),
    GetPage(
      name: createStory,
      bindings: [
        JournalBindings(),
        UtilsPageBinding(),
      ],
      page: () => const CreateTodayStory(),
    ),
  ];
}
