import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/DM/event_dm.dart';
import '../resourses/colors_manager.dart';
import 'event_date_widget.dart';
import 'event_title_widget.dart';

class CustomEvent extends StatelessWidget {
  const CustomEvent({super.key, required this.event, required this.favEvent});

  final EventDM event;
  final bool favEvent;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: REdgeInsets.all(16),
        width: double.infinity,
        height: 203.h,
        decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.blue, width: 1.w),
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(event.category.imagePath))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EventDateWidget(
              date: event.dateTime,
            ),
            const Spacer(),
            EventTitleWidget(
              event: event,
              favEvent: favEvent,
            ),
          ],
        ));
  }
}