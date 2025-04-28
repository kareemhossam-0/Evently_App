import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resourses/assets_manager.dart';
import '../../../../../core/resourses/colors_manager.dart';

class CustomProfileHeader extends StatelessWidget {
  const CustomProfileHeader({
    super.key,
    required this.userName,
    required this.email,
  });

  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.blue,

        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(48.r)),
      ),

      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(8),

          child: Row(
            children: [
              Image.asset(ImageAssets.route),

              SizedBox(width: 4.w),

              Expanded(
                flex: 2,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      userName,

                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      email,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
