import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_hours_weather_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyColumnDiagram extends StatelessWidget {
  final List<ForecastHourWeather> weather;
  const MyColumnDiagram({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 180,
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
              enableSideBySideSeriesPlacement: true,
              primaryXAxis: const CategoryAxis(
                labelPosition: ChartDataLabelPosition.inside,
                axisLine: AxisLine(width: 0),
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                crossesAt: 0,
              ),
              primaryYAxis: const NumericAxis(
                isVisible: false,
                minimum: 0,
                maximum: 30,
                interval: 10,
              ),
              series: <CartesianSeries>[
                ColumnSeries<ForecastHourWeather, String>(
                  animationDuration: 0,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    width: 0.93,
                    color: Colors.blue,
                    dataSource: weather,
                    dataLabelSettings: const DataLabelSettings(isVisible: true, offset: Offset(0, -35), textStyle: TextStyle(fontSize: 11,color: Colors.white)),
                    dataLabelMapper: (ForecastHourWeather data, _) => "${data.temperature.round().toString()}°" ,
                    xValueMapper: (ForecastHourWeather data, _) => data.time.substring(10,16),
                    yValueMapper: (ForecastHourWeather data, _) => (data.temperature + 40) / 4)
              ],
            )),
    );
  }
}
