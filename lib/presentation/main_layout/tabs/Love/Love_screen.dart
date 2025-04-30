import 'package:evently_app/core/widgets/custom_event.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/DM/event_dm.dart';

class LoveScreen extends StatelessWidget {
  const LoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: REdgeInsets.all(16),
            child: CustomTextFormField(
              labelText: 'Search for Event',
              labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              onClick: () {},
              prefixIcon: (Icons.search),
              keyboardType: TextInputType.text,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder:
                  (context, index) => CustomEvent(
                    eventDM: EventDM(
                      category: "Meeting",
                      title: "Meeting for Updating The Development Method",
                      description:
                          "Meeting for Updating The Development Method",
                      date: DateTime.now(),

                      time: TimeOfDay.now(),
                    ),
                  ),

              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
