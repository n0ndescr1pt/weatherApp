import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class CurrentWeatherPad extends StatelessWidget {
  final Weather weather;
  const CurrentWeatherPad({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          weather.icon,
          width: 100,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${weather.temperature.round()}°"),
            Text(
                "Feels like ${weather.feelsLike.round()}°"),
          ],
        ),
      ],
    );
  }
}
