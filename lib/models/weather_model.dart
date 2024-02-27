import 'package:weather_app/models/forecast_days_weather_model.dart';
import 'package:weather_app/models/forecast_hours_weather_model.dart';

class Weather {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final String mainCondition;
  final String description;
  final double windSpeed;
  final int windDeg;
  final String icon;
  final List<ForecastHourWeather> hourForecast; //прогноз по часам
  final List<ForecastDaysWeather> daysforecast; //прогноз на неделю

  Weather({
    required this.windSpeed,
    required this.hourForecast,
    required this.windDeg,
    required this.description,
    required this.feelsLike,
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.icon,
    required this.daysforecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final List<ForecastHourWeather> hourForecast = [];
    json["forecast"]['forecastday'][0]['hour'].forEach((forecast) => {
          hourForecast.add(ForecastHourWeather(
              icon: forecast['condition']['icon'],
              windDeg: forecast["wind_degree"],
              time: forecast['time'],
              windDir: forecast['wind_dir'],
              temperature: forecast['temp_c'],
              mainCondition: forecast['condition']['text'])),
        });

    final List<ForecastDaysWeather> daysforecast = [];
    json["forecast"]['forecastday'].forEach((forecast) => {
      print(forecast["date"]),
          daysforecast.add(ForecastDaysWeather(
            windSpeed: forecast["day"]["maxwind_kph"],
            avghumidity: forecast["day"]["avghumidity"],
            date: forecast["date"],
            minTemperature: forecast["day"]['mintemp_c'],
            maxTemperature: forecast["day"]['maxtemp_c'],
            mainCondition: forecast["day"]['condition']['text'],
            icon: forecast["day"]['condition']['icon'],
          ))
        });

    return Weather(
      hourForecast: hourForecast,
      daysforecast: daysforecast,
      windSpeed: json['current']['wind_kph'].toDouble(),
      windDeg: json['current']['wind_degree'].toInt(),
      feelsLike: json['current']['feelslike_c'].toDouble(),
      description: json['current']['condition']['text'],
      cityName: json['location']['name'],
      icon: json['current']['condition']['icon'],
      temperature: json['current']['temp_c'].toDouble(),
      mainCondition: json['current']['condition']['text'],
    );
  }
}



