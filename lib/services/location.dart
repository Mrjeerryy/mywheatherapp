import 'package:geolocator/geolocator.dart';
import 'package:mywheatherapp/screens/loading_screen.dart';

class location {
  Future getlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      lat = position.latitude;
      print(lat);
      long = position.longitude;
      print(long);
    } catch (e) {
      print("$e #########error in getting location");
    }
  }
}
