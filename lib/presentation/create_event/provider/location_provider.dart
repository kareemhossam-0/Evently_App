import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider extends ChangeNotifier {
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Set<Marker> marker = {
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.43296265331129, -122.08832357078792),
    ),
  };

  goToLocation(LatLng location) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(location.latitude, location.longitude),
          zoom: 17,
        ),
      ),
    );
    marker = {
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(location.latitude, location.longitude),
      ),
    };
    notifyListeners();
  }

  late GoogleMapController mapController;

  LatLng? selecteLocation;

  changeSelectedLocation(LatLng location) {
    selecteLocation = location;
    goToLocation(location);
    notifyListeners();
  }
}
