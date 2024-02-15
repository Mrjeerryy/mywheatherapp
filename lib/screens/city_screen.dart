import 'package:flutter/material.dart';

import 'package:mywheatherapp/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String CityName = "";
  @override
  Widget build(BuildContext context) {
    var kTextstyle = kButtonTextStyle;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        CityName = value;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          icon: Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white,
                          hintText: "Enter the city",
                          hintStyle: TextStyle(color: Colors.black)))),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, CityName);
                },
                child: Text(
                  'Get Weather',
                  style: kTextstyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
