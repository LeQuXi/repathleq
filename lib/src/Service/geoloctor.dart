import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GeoloctorService {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
