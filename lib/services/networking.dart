import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:mywheatherapp/screens/loading_screen.dart';

import 'package:mywheatherapp/utilities/constants.dart';

class networing {
  Future getdatafromcity(String cityName) async {
// ...

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      http.Response response = await http.get(Uri.http(
          "api.openweathermap.org",
          "/data/2.5/weather",
          {"q": cityName, "appid": apikey, "units": "metric"}));

      if (response.statusCode == 200) {
        String netdata = response.body;
        print(netdata);

        return jsonDecode(netdata);
      } else {
        print(response.statusCode);
      }
    } else
      print('No Internet Connection');
  }

  Future getdata() async {
// ...

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      http.Response response = await http.get(Uri.http(
        "api.openweathermap.org",
        "/data/2.5/weather",
        {"lat": "${lat}", "lon": "${long}", "appid": apikey, "units": "metric"},
      ));

      if (response.statusCode == 200) {
        String netdata = response.body;
        print(netdata);

        return jsonDecode(netdata);
      } else {
        print(response.statusCode);
      }
    } else
      print('No Internet Connection');
  }
}
