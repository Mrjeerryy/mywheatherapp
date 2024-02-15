import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mywheatherapp/screens/location_screen.dart';

import 'package:mywheatherapp/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

double lat = 0;

double long = 0;

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getion();
  }

  Future<void> getion() async {
    WeatherModel weathermodel = new WeatherModel();
    var weatherData = await weathermodel.getweatherdata();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatheardata: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitRipple(
        color: Colors.white,
        size: 150,
      ),
    ));
  }
}
