import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventTitleWidget extends StatelessWidget {
  const EventTitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: REdgeInsets.all(6),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 8),

        child: Row(
          children: [
            Expanded(
              child: Text(title, style: Theme.of(context).textTheme.labelSmall),
            ),

            Icon(Icons.favorite, color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}
