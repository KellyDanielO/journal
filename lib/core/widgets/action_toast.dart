import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../helpers/functions.dart';
import '../themes/colors.dart';

actionToast(String message) {
  if (!GetPlatform.isLinux) {
    Fluttertoast.showToast(
      msg: message.capitalize.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.whiteColor,
      fontSize: isTablet() ? 8.sp : 14.sp,
    );
  }
}
