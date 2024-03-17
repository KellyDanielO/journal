import 'package:flutter/material.dart';

import '../../../../../core/helpers/sizes.dart';
import '../multiple.task.widget.dart';
import '../single.task.widgets.dart';

class MobileTaskWidget extends StatefulWidget {
  final double width;
  final double height;
  const MobileTaskWidget(
      {super.key, required this.width, required this.height});

  @override
  State<MobileTaskWidget> createState() => _MobileTaskWidgetState();
}

class _MobileTaskWidgetState extends State<MobileTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height * .85,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MultipleTaskWidget(
              titleTask: 'Today\'s plan',
              tasks: const [
                'wake up',
                'pray',
                'eat',
                'church',
                'eat',
                'code',
                'watch anime',
              ],
              width: widget.width,
            ),
            MultipleTaskWidget(
              titleTask: 'Go Home',
              tasks: const ['kndcmkmxc'],
              width: widget.width,
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
            const SingleTaskWidget(
              taskName: 'Today\'s Task',
            ),
          ],
        ),
      ),
    );
  }
}
