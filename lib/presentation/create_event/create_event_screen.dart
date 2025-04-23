import 'package:evently_app/core/resourses/assets_manager.dart';
import 'package:evently_app/core/resourses/constant_manager.dart';
import 'package:evently_app/core/resourses/routes_manager.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/core/widgets/custom_text_botton.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resourses/colors_manager.dart';
import '../../core/widgets/custom_elevated_button.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, RoutesManager.mainLayout);
          },

          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        title: Text(
          'Create Event',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(ImageAssets.meeting),
                ),
              ),
              CustomTabBar(
                categories: ConstantManager.categoriesWithOutAll,
                selectedTabBg: ColorsManager.blue,
                unselectedTabBg: Colors.transparent,
                selectedLabelColor: ColorsManager.light,
                unselectedLabelColor: ColorsManager.blue,
              ),
              SizedBox(height: 10.h),
              Text("Title", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 8.h),

              CustomTextFormField(
                labelText: 'Event Title',
                prefixIcon: Icons.edit_note_outlined,
              ),
              SizedBox(height: 8.h),

              Text("Description", style: Theme.of(context).textTheme.bodySmall),

              SizedBox(height: 8.h),

              const CustomTextFormField(
                keyboardType: TextInputType.text,
                maxLines: 4,
                labelText: 'Event Description',
              ),
              Row(
                children: [
                  Icon(Icons.date_range),

                  SizedBox(width: 10.w),

                  Expanded(
                    child: Text(
                      "Event Date",

                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),

                  CustomTextBotton(
                    text: 'Event Date',
                    onPress: () {},
                    alignment: Alignment.centerRight,
                    underLine: TextDecoration.none,
                  ),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.access_time_outlined),

                  SizedBox(width: 10.w),

                  Expanded(
                    child: Text(
                      "Event Time",

                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),

                  CustomTextBotton(
                    text: 'Event Time',
                    onPress: () {},
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              CustomElevatedButton(title: "Add Event", onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
