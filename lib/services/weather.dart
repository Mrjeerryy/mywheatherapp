import 'package:mywheatherapp/services/location.dart';
import 'package:mywheatherapp/services/networking.dart';

class WeatherModel {
  Future<dynamic> getcityweatherdata(String cityname) async {
    networing network2 = networing();
    var cityweather = await network2.getdatafromcity(cityname);
    return cityweather;
  }

  Future<dynamic> getweatherdata() async {
    location location1 = location();
    await location1.getlocation();

    networing network = networing();
    var weatherData = await network.getdata();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
