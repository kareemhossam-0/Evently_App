import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/DM/event_dm.dart';
import '../data/firebase_services/firebase_services.dart';

class EventTitleWidget extends StatefulWidget {
  const EventTitleWidget(
      {super.key, required this.event, required this.favEvent});

  final EventDM event;

  final bool favEvent;

  @override
  State<EventTitleWidget> createState() => _EventTitleWidgetState();
}

class _EventTitleWidgetState extends State<EventTitleWidget> {
  late bool isFavourite = widget.favEvent;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: REdgeInsets.all(6),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 8),

        child: Row(
          children: [
            Expanded(
              child: Text(widget.event.title, style: Theme
                  .of(context)
                  .textTheme
                  .labelSmall),
            ),

            IconButton(
                onPressed: _markEventAsFav,
                icon: Icon(isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined))
          ],
        ),
      ),
    );
  }

  void _markEventAsFav() {
    isFavourite = !isFavourite;
    if (isFavourite) {
      FirebaseServices.addEventToFavourite(widget.event.id);
    } else {
      FirebaseServices.removeEventFromFav(widget.event.id);
    }
    setState(() {});
  }
}

