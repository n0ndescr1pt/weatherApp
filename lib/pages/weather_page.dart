import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  final Weather weather;
  const WeatherPage({super.key, required this.weather});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {


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
                Image.network("https://cdn.weatherapi.com/weather/64x64/day/113.png",width: 100, fit: BoxFit.contain,),
                Column(
                  children: [
                    Text("${widget.weather.temperature.round() }°"),
                    Text("Feels like ${widget.weather.feelsLike.round() }° ${widget.weather.hourForecast[0].time}"),
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
