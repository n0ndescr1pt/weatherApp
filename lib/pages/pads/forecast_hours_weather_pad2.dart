import 'package:flutter/material.dart';
import 'package:weather_app/components/my_chart_hour_column.dart';
import 'package:weather_app/models/forecast_hours_weather_model.dart';
import 'package:weather_app/models/weather_model.dart';

class ForecastHourPad2 extends StatelessWidget {
  final Weather weather;
  const ForecastHourPad2({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MyColumnDiagram(weather: weather.hourForecast.sublist(13, 23)),
      const SizedBox(
        height: 12,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weather.hourForecast
            .sublist(13, 23)
            .map((ForecastHourWeather data) =>
                (Image.network(width: 30, "https:${data.icon}")))
            .toList(),
      )
    ]);
  }
}
