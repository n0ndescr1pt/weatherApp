class Weather {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final String mainCondition;
  final String description;
  final double windSpeed;
  final int windDeg;

  Weather({
    required this.windSpeed,
    required this.windDeg,
    required this.description,
    required this.feelsLike,
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      windSpeed: json['wind']['speed'].toDouble(),
      windDeg: json['wind']['deg'].toInt(),
      feelsLike: json['main']['feels_like'].toDouble(),
      description: json['weather'][0]['description'],
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
