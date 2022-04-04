import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/src/Service/geoloctor.dart';

class ApplicationBloc with ChangeNotifier {
  final geoloctorService = GeoloctorService();

// variable
  Position currentLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoloctorService.getCurrentLocation();
    notifyListeners();
  }
}
