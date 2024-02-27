class ForecastHourWeather {
  final double temperature;
  final String mainCondition;
  final int windDeg;
  final String windDir;
  final String icon;
  final String time;

  ForecastHourWeather({
    required this.temperature,
    required this.mainCondition,
    required this.windDeg,
    required this.windDir,
    required this.icon,
    required this.time,
  });
}