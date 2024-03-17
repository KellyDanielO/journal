import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/helpers/sizes.dart';

class SingleTaskWidget extends StatefulWidget {
  final String taskName;
  const SingleTaskWidget({
    super.key,
    required this.taskName,
  });

  @override
  State<SingleTaskWidget> createState() => _SingleTaskWidgetState();
}

class _SingleTaskWidgetState extends State<SingleTaskWidget> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.normalPadding - 5.w,
        horizontal: AppSizes.normalPadding - 5.w,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.labelSmall!.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: <Widget>[
          Checkbox(
              value: checked,
              onChanged: (value) {
                setState(() {
                  checked = value!;
                });
              }),
          Text(
            widget.taskName,
            style: isTablet()
                ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                      decoration: checked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    )
                : Theme.of(context).textTheme.headlineSmall!.copyWith(
                      decoration: checked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
          ),
        ],
      ),
    );
  }
}
