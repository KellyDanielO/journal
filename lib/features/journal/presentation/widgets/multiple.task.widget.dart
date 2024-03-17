import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/helpers/sizes.dart';

class MultipleTaskWidget extends StatefulWidget {
  final String titleTask;
  final List<String> tasks;
  final double width;
  const MultipleTaskWidget({
    super.key,
    required this.titleTask,
    required this.tasks,
    required this.width,
  });

  @override
  State<MultipleTaskWidget> createState() => _MultipleTaskWidgetState();
}

class _MultipleTaskWidgetState extends State<MultipleTaskWidget> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                  value: checked,
                  onChanged: (value) {
                    setState(() {
                      checked = value!;
                    });
                  }),
              Text(
                widget.titleTask,
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
          SizedBox(
            width: widget.width * .8,
            child: Column(
              children: List.generate(
                widget.tasks.length,
                (index) => Row(
                  children: <Widget>[
                    Checkbox(
                        value: checked,
                        onChanged: (value) {
                          setState(() {
                            checked = value!;
                          });
                        }),
                    Text(
                      widget.tasks[index],
                      style: isTablet()
                          ? Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
