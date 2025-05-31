import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/DM/category_dm.dart';
import '../../../../core/data/DM/event_dm.dart';
import '../../../../core/data/DM/userDM.dart';
import '../../../../core/data/firebase_services/firebase_services.dart';
import '../../../../core/resourses/colors_manager.dart';
import '../../../../core/resourses/constant_manager.dart';
import '../../../../core/widgets/custom_event.dart';
import '../../../../core/widgets/custom_tab_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryDM selectedCategory = ConstantManager.categories[0];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .primaryColor,
              borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(16.r))),
          child: Padding(
            padding:
            const EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back ✨",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),
                Text(
                  UserDM.currentUSer!.name,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: ColorsManager.white,
                    ),
                    Text(
                      "Cairo, Egypt",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTabBar(
                  onCategoryTabClicked: (category) {
                    selectedCategory = category;
                    setState(() {});
                  },
                  categories: ConstantManager.categories,
                  selectedTabBg: ColorsManager.light,
                  unselectedTabBg: Colors.transparent,
                  selectedLabelColor: ColorsManager.blue,
                  unselectedLabelColor: ColorsManager.light,
                )
              ],
            ),
          ),
        ),
        StreamBuilder(
          stream: FirebaseServices.getEventsRealTimeUpdates(selectedCategory),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Text("Error");
            }
            List<EventDM> events = snapshot.data ?? [];
            return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      CustomEvent(
                        event: events[index],
                        favEvent: UserDM.currentUSer!.favouriteEventsId
                            .contains(events[index].id),
                      ),
                  itemCount: events.length,
                ));
          },
        )
      ],
    );
  }
}