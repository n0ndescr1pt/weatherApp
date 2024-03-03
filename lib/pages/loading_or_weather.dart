import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/loading_page.dart';
import 'package:weather_app/pages/navigation_page.dart';
import 'package:weather_app/services/weather_services.dart';

class LoadingOrWeather extends StatefulWidget {
  final String? cityName;
  const LoadingOrWeather({super.key, this.cityName});

  @override
  State<LoadingOrWeather> createState() => _LoadingOrWeatherState();
}

class _LoadingOrWeatherState extends State<LoadingOrWeather> {
  bool showLoadingPage = true;

  final _weatherService = WeatherServices('3c14e0708ebf409698d85942242702');

  late Weather _weather;

  _fetchWeather(BuildContext context) async {
    String cityName;
    if (widget.cityName == null) {
      cityName = await _weatherService.getCurrentCity();
    } else {
      cityName = widget.cityName!;
    }

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
        showLoadingPage = !showLoadingPage;
      });
    } catch (e) {
      String curCityName = await _weatherService.getCurrentCity();
      final weather = await _weatherService.getWeather(curCityName);
      setState(() {
        _weather = weather;
        showLoadingPage = !showLoadingPage;
      });
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Write correct city")));
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchWeather(context);
  }

  @override
  Widget build(BuildContext context) {
    if (showLoadingPage) {
      return const LoadingPage();
    } else {
      return NavigationPage(weather: _weather);
    }
  }
}
