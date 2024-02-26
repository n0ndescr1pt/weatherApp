import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  final Weather weather;
  const WeatherPage({super.key, required this.weather});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/cloud.json';
      case 'smoke':
        return 'assets/smoke.json';
      case 'snow':
        return 'assets/snow.json';
      case 'rain':
        return 'assets/rainy.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20,),
            const Text("Right now"),
            Text(widget.weather.description),
            Text("${widget.weather.windSpeed} m/s winds from "),
            Row(
              children: [
                Lottie.asset(getWeatherAnimation(widget.weather.mainCondition), width: 150),
                Column(
                  children: [
                    Text("${widget.weather.temperature.round() }°"),
                    Text("Feels like ${widget.weather.feelsLike.round() }°"),
                  ],
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
