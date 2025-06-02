import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'en';

  bool get isDark => currentTheme == ThemeMode.dark;

  bool get isEnglish => currentLanguage == "en";

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeAppLang(String newlang) {
    if (currentLanguage == newlang) return;
    currentLanguage = newlang;
    notifyListeners();
  }

  /// location

  Location location = Location();
  String locationMassage = "check";


  getLocation() async {
    bool isPermissionEnable = await _checkPermission();
    if (!isPermissionEnable) {
      locationMassage = 'Check Permission denied';
      notifyListeners();

      return;
    }
    bool isServiceEnable = await _checkServiceEnable();
    if (!isServiceEnable) {
      locationMassage = 'Check Services denied';
      notifyListeners();
      return;
    }
    var locationData = await location.getLocation();
    goToLocation(
        LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0));
  }

  Future<bool> _checkPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> _checkServiceEnable() async {
    bool isServiceEnable = await location.serviceEnabled();
    if (!isServiceEnable) {
      isServiceEnable = await location.requestService();
    }
    return isServiceEnable;
  }

  CameraPosition initialCameraPosition = const CameraPosition(

      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Set<Marker> marker = {
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.43296265331129, -122.08832357078792),
    ),
  };
  late GoogleMapController mapController;


  goToLocation(LatLng location) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(location.latitude, location.longitude), zoom: 17),),);
    marker = {
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(location.latitude, location.longitude),
      ),
    };
    notifyListeners();
  }

}
