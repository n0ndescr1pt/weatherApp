import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';

class CurrentWeatherPad extends StatelessWidget {
  final Weather weather;
  const CurrentWeatherPad({super.key, required this.weather});

String? _getWeatherState(int code){
  switch(code){
    case 1000 : return 'assets/sunny.json';
    case 1006 || 1003 || 1030 || 1009: return 'assets/cloud.json';
    case 1063 || 1087 || 1150 || 1150 || 1153 || 1168 || 1180 || 1183 || 1186 || 1189 || 1192 || 1195 || 1198 : return 'assets/rainy.json';
    case 1030 || 1135: 'assets/smoke.json';
    case 1066 || 1114 || 1117 || 1210 || 1216 || 1213 || 1222 || 1225 || 1237 || 1240 || 1246 || 1249 || 1252 || 1255: return 'assets/snow.json';
    case 1282 || 1279 || 1276 || 1273: return 'assets/thunder.json';
    default: return 'assets/sunny.json';
  }
}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Lottie.asset(_getWeatherState(weather.conditionCode) ?? 'assets/sunny.json'),
        SizedBox(width: 12,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${weather.temperature.round()}°",style: TextStyle(fontSize: 52),),
            Text(
                "Feels like ${weather.feelsLike.round()}°",style: TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }
}
