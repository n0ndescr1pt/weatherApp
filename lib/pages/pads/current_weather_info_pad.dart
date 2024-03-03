import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class CurrentWeatherInfoPad extends StatelessWidget {
  final Weather weather;
  const CurrentWeatherInfoPad({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icon/humidity.png', width: 32, height: 32),
              const SizedBox(width: 10),
              Text("Humudity ${weather.humidity.toString()} %")
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icon/gauge.png', width: 32, height: 32),
              const SizedBox(width: 10),
              Text("Pressure ${weather.pressure.round().toString()}mb")
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icon/precipitation.png', width: 32, height: 32),
              const SizedBox(width: 10),
              Text("Precip level ${weather.precip} mm")
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icon/clouds.png', width: 32, height: 32),
              const SizedBox(width: 10),
              Text("Cloudy ${weather.cloud} %")
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icon/sunrise.png', width: 32, height: 32),
              const SizedBox(width: 10),
              Text("Sunrise ${weather.sunRise} -> Sunset ${weather.sunSet}.")
            ],
          ),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icon/half-moon.png', width: 32, height: 32),
              const SizedBox(width: 10),
              Text("Moonphase ${weather.moonPhase}")
            ],
          ),
          SizedBox(height: 30,)
        ],
      );
  }
}
