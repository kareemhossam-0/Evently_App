import 'package:evently_app/core/data/DM/event_dm.dart';
import 'package:evently_app/core/resourses/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapItem extends StatelessWidget {
  const MapItem({super.key, required this.eventDM});

  final EventDM eventDM;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: REdgeInsets.all(8),
      width: size.width,

      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.blue, width: 2.h),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                width: double.infinity,
                height: double.infinity,
                eventDM.category.imagePath ?? "",

                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.all(16),
            child: Expanded(
              flex: 4,
              child: Padding(
                padding: REdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventDM.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "${eventDM.lat},${eventDM.lng}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
