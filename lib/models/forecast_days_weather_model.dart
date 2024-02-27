
class ForecastDaysWeather {
  final double minTemperature;
  final double maxTemperature;
  final String mainCondition;
  final double windSpeed;
  final String icon;
  final String date;
  final int avghumidity;

  ForecastDaysWeather({
    required this.windSpeed,
    required this.avghumidity,
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.mainCondition,
    required this.icon,
  });
}