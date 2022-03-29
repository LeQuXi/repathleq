import 'package:geolocator/geolocator.dart';

class GeoloctorService{
  Future<Position> getCurrentLocation() async{
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high );
  }
}