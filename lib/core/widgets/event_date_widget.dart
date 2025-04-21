import 'package:evently_app/core/extentions/date_extentions.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDateWidget extends StatelessWidget {
  EventDateWidget({super.key, required this.date});

  final DateTime date; // day month year hour min sec millSec microSec

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: REdgeInsets.all(8),
      child: Padding(
        padding: REdgeInsets.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              date.day.toString(),

              style: Theme.of(context).textTheme.labelMedium,
            ),

            Text(
              date.getMonthFormDateTime,

              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
