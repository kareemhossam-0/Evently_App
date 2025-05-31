import 'package:evently_app/core/widgets/custom_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/data/DM/event_dm.dart';
import '../../../../core/data/firebase_services/firebase_services.dart';
import '../../../../core/resourses/colors_manager.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<EventDM> favEvents = [];
  List<EventDM> filteredList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavouriteEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (searchKey) {
                getFavouriteEventsBySearchKey(searchKey);
              },
              style: GoogleFonts.inter(
                color: ColorsManager.black,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                hintText: "Search For Event",
                hintStyle: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: ColorsManager.grey,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.blue),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.red),
                ),
              ),
            ),
            Expanded(
              child:
                  filteredList.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        itemBuilder:
                            (context, index) => CustomEvent(
                              event: filteredList[index],
                              favEvent: true,
                            ),
                        itemCount: filteredList.length,
                      ),
            ),
          ],
        ),
      ),
    );
  }

  void getFavouriteEvents() async {
    favEvents = await FirebaseServices.getFavouriteEvents();
    filteredList = favEvents;
    setState(() {});
  }

  void getFavouriteEventsBySearchKey(String searchKey) {
    if (searchKey.trim().isEmpty) {
      filteredList = favEvents;
    } else {
      filteredList =
          favEvents
              .where(
                (event) =>
                    event.title.toLowerCase().contains(
                      searchKey.toLowerCase(),
                    ) ||
                    event.description.toLowerCase().contains(
                      searchKey.toLowerCase(),
                    ),
              )
              .toList();
    }

    setState(() {});
  }
}
