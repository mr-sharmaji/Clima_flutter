import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'c156ff85b122d3ee4eeec277bc0993ff';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(
        url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  double latitude;
  double longitude;
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    var url = '$openWeatherMapUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(
        url);
    var weatherData = await networkHelper.getData();
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
    if (temp > 30) {
      return 'maai bohot garmi haai bro!';
    } else if (temp > 20) {
      return 'maai eakdam sahi temperature haai bro!';
    } else if (temp < 10) {
      return 'maai bohot thandi haai bro!🧤';
    } else {
      return 'maai samaj nhi aa raha bro!';
    }
  }
}
