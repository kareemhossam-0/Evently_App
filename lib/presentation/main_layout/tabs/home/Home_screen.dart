import 'package:evently_app/core/resourses/colors_manager.dart';
import 'package:evently_app/core/resourses/constant_manager.dart';
import 'package:evently_app/core/widgets/custom_event.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/DM/event_dm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,

          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Welcome Back ✨",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            "John Safwat",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      Column(children: [Icon(Icons.light_mode_sharp)]),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: ColorsManager.white,
                      ),
                      Text(
                        "Cairo, Egypt",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  CustomTabBar(
                    selectedTabBg: ColorsManager.light,
                    unselectedTabBg: Colors.transparent,
                    selectedLabelColor: ColorsManager.blue,
                    unselectedLabelColor: ColorsManager.light,
                    categories: ConstantManager.categories,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder:
                (context, index) => CustomEvent(
                  eventDM: EventDM(
                    category: "Meeting",
                    title: "Meeting for Updating The Development Method",
                    description: "Meeting for Updating The Development Method",
                    date: DateTime.now(),

                    time: TimeOfDay.now(),
                  ),
                ),

            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
