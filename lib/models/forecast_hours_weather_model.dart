class ForecastHourWeather {
  final double temperature;
  final String mainCondition;
  final int windDeg;
  final String windDir;
  final String icon;
  final String time;

  ForecastHourWeather({
    required this.windDeg,
    required this.time,
    required this.windDir,
    required this.temperature,
    required this.mainCondition,
    required this.icon,
  });
}