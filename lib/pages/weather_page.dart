import 'package:flutter/material.dart';
import 'package:weather_app/components/my_chart_column.dart';
import 'package:weather_app/components/my_page_view.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/pads/current_weather_info_pad.dart';
import 'package:weather_app/pages/pads/current_weather_pad.dart';

class WeatherPage extends StatefulWidget {
  final Weather weather;
  const WeatherPage({super.key, required this.weather});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text("Right now"),
          Text(widget.weather.description),
          Text("${widget.weather.windSpeed} m/s winds from "),
          MyPageView(
              pageController: _pageController,
              firstWidget: CurrentWeatherPad(weather: widget.weather),
              secondWidget: CurrentWeatherInfoPad(weather: widget.weather),
              count: 2),
              
          MyColumnDiagram(weather: [-1,-12,-10,-5,7,9,37,21,23,11,4,12],),
          
        ],
      ),
    );
  }
}
