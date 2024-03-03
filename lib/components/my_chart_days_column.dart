import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_days_weather_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyColumnDaysDiagram extends StatelessWidget {
  final List<ForecastDaysWeather> weather;
  const MyColumnDaysDiagram({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
          color: Colors.grey[300],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SfCartesianChart(
            plotAreaBackgroundColor: Colors.transparent,
            margin: EdgeInsets.all(0),
            borderColor: Colors.transparent,
            borderWidth: 0,
            plotAreaBorderWidth: 0,
            primaryXAxis: const CategoryAxis(
              isInversed: true,
              isVisible: true,
            ),
            primaryYAxis: const NumericAxis(
              isVisible: false,
            ),
            series: [
              StackedBarSeries<ForecastDaysWeather, String>(
                  animationDuration: 0,
                  width: 0.93,
                  color: Colors.red,
                  dataSource: weather,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      offset: Offset(0, 0),
                      textStyle: TextStyle(fontSize: 14, color: Colors.white)),
                  dataLabelMapper: (ForecastDaysWeather data, _) =>
                      "${(data.minTemperature).round().toString()}°",
                  xValueMapper: (ForecastDaysWeather data, _) => data.date,
                  yValueMapper: (ForecastDaysWeather data, _) =>
                      (data.minTemperature + 40)/5),
              StackedBarSeries<ForecastDaysWeather, String>(
                  animationDuration: 0,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  width: 0.93,
                  color: Colors.blue,
                  dataSource: weather,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      offset: Offset(0, 0),
                      textStyle: TextStyle(fontSize: 14, color: Colors.white)),
                  dataLabelMapper: (data, _) =>
                      "${(data.maxTemperature).round().toString()}°",
                  xValueMapper: (data, _) => data.date,
                  yValueMapper: (data, _) => ((data.maxTemperature - data.minTemperature) + 40 ) /6 ),
              
            ],
          )),
    );
  }
}
