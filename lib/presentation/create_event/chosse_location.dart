import 'package:evently_app/presentation/create_event/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ChosseLocation extends StatelessWidget {
  const ChosseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocationProvider(),
      child: Consumer<LocationProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (controller) {
                      provider.mapController = controller;
                    },
                    onTap: (LatLng latLong) {
                      provider.changeSelectedLocation(latLong);
                      Navigator.pop(context, provider.selecteLocation);
                    },
                    markers: provider.marker,
                    initialCameraPosition: provider.initialCameraPosition,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.r),
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Tap On Location To Select",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
