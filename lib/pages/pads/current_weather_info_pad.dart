import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class CurrentWeatherInfoPad extends StatelessWidget {
  final Weather weather;
  const CurrentWeatherInfoPad({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.person),
            SizedBox(
              width: 20,
            ),
            Text(weather.windSpeed.toString())
          ],
        ),
        Row(
          children: [
            Icon(Icons.person),
            SizedBox(
              width: 20,
            ),
            Text(weather.windSpeed.toString())
          ],
        ),
        Row(
          children: [
            Icon(Icons.person),
            SizedBox(
              width: 20,
            ),
            Text(weather.windSpeed.toString())
          ],
        )
      ],
    );
  }
}
