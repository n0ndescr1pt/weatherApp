import 'package:flutter/material.dart';
import 'package:weather_app/components/my_chart_hour_column.dart';
import 'package:weather_app/models/forecast_hours_weather_model.dart';
import 'package:weather_app/models/weather_model.dart';

class ForecastHourPad extends StatelessWidget {
  final Weather weather;
  const ForecastHourPad({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MyColumnDiagram(weather: weather.hourForecast.sublist(13, 24)),
      const SizedBox(
        height: 12,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weather.hourForecast
            .sublist(13, 24)
            .map((ForecastHourWeather data) => (Image.network(
                fit: BoxFit.fill, width: 32, "https:${data.icon}")))
            .toList(),
      )
    ]);
  }
}
