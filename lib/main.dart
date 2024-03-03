import 'package:flutter/material.dart';
import 'package:weather_app/pages/loading_or_weather.dart';
import 'theme/light_mode.dart';
import 'theme/dark_mode.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoadingOrWeather(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
