import 'package:flutter/material.dart';
import 'package:mywheatherapp/screens/city_screen.dart';
import 'package:mywheatherapp/services/weather.dart';
import 'package:mywheatherapp/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatheardata});
  final weatheardata;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

String cityname = "";
int temp = 0;
String icon = "";
String massage = "";
dynamic tem = "";

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.weatheardata);
    getweathearinfo(widget.weatheardata);
  }

  WeatherModel weatherModel = new WeatherModel();
  void getweathearinfo(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        temp = 0;
        icon = "error";
        cityname = "unavailable";
        massage = "unable to fetch data";
      } else {
        print(weatherdata);
        cityname = weatherdata['name'];
        print('City Name: $cityname');

        temp = weatherdata['main']['temp'].toInt();
        print('Temperature: $temp');
        massage = weatherModel.getMessage(temp);

        var weatherid = weatherdata['weather'][0]['id'];
        icon = weatherModel.getWeatherIcon(temp);
        print('Weather ID: $weatherid');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var value = await weatherModel.getweatherdata();
                      print(value);
                      getweathearinfo(value);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      cityname = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (cityname != null) {
                        var weather =
                            await weatherModel.getcityweatherdata(cityname);
                        getweathearinfo(weather);
                      }

                      print(tem);
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$icon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${massage} in ${cityname}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
