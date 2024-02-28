import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'functions.dart';

class AppSizes{
  static double bodyPadding = isTablet() ? 10.w : 20.w;
  static double normalSize = isTablet() ? 6.w : 12.w;
  static double normalIconSize = isTablet() ? 10.w : 24.w;
  static double normalPadding = isTablet() ? 5.w : 10.w;
}