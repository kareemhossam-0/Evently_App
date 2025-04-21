import 'package:evently_app/core/data/DM/event_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resourses/assets_manager.dart';
import '../resourses/colors_manager.dart';
import 'event_date_widget.dart';
import 'event_title_widget.dart';

class CustomEvent extends StatelessWidget {
  const CustomEvent({super.key, required this.eventDM});

  final EventDM eventDM;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(16),
      width: double.infinity,
      height: 203.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.blue, width: 2.w),
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ImageAssets.birthday),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EventDateWidget(date: eventDM.date),
          const Spacer(),
          EventTitleWidget(title: eventDM.title),
        ],
      ),
    );
  }
}
