import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServices{
  static const BASE_URL = "https://api.weatherapi.com/v1/forecast.json";
  final String apiKEY;

  WeatherServices(this.apiKEY);
   
  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL?key=$apiKEY&q=$cityName&days=7&aqi=no&alerts=no'));

    if (response.statusCode == 200){
      return Weather.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('failed to load');
    }
  }

  Future<String> getCurrentCity() async {
    //get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;

    return city ?? "";
  }
  
}