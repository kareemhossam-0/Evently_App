import 'package:evently_app/core/data/DM/category_dm.dart';
import 'package:evently_app/presentation/main_layout/tabs/map/widgets/map_item.dart';
import 'package:evently_app/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/DM/event_dm.dart';
import '../../../../core/data/firebase_services/firebase_services.dart';
import '../../../../core/resourses/constant_manager.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late ConfigProvider configProvider;
  CategoryDM selectedCategory = ConstantManager.categories[0];

  @override
  void initState() {
    // TODO: implement initState
    configProvider = Provider.of<ConfigProvider>(context, listen: false);
    configProvider.getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);

    return Consumer<ConfigProvider>(
      builder: (context, provider, child) {
        return Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: provider.initialCameraPosition,
              markers: provider.marker,
              onMapCreated: (controller) {
                provider.mapController = controller;
              },
            ),
            Positioned(
              bottom: 10.h,
              right: 0,
              left: 0,
              child: SizedBox(
                height: 110.h,
                child: StreamBuilder(
                  stream: FirebaseServices.getEventsRealTimeUpdates(
                    selectedCategory,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("Error");
                    }
                    List<EventDM> events = snapshot.data ?? [];
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder:
                            (context, index) => InkWell(
                              onTap: () {
                                provider.goToLocation(
                                  LatLng(
                                    events[index].lat ?? 0,
                                    events[index].lng ?? 0,
                                  ),
                                );
                              },
                              child: MapItem(eventDM: events[index]),
                            ),
                        itemCount: events.length,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
