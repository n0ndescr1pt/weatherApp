import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_hours_weather_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyColumnDiagram extends StatelessWidget {
  final List<int> weather;
  const MyColumnDiagram({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
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
            primaryXAxis: CategoryAxis(
              labelPosition: ChartDataLabelPosition.inside,
              axisLine: AxisLine(width: 0),
              majorGridLines: MajorGridLines(width: 0),
              majorTickLines: MajorTickLines(width: 0),
              crossesAt: 0,
            ),
            primaryYAxis: NumericAxis(
              isVisible: false,
              minimum: 0,
              maximum: 20,
              interval: 0.5,
            ),
            series: <CartesianSeries>[
              ColumnSeries<int, String>(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  width: 0.9,
                  color: Colors.blue,
                  dataSource: weather,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  dataLabelMapper: (__, _) => "as",
                  xValueMapper: (int data, _) => data.toString(),
                  yValueMapper: (int data, _) => (data + 40) / 5)
            ],
          )),
    );
  }
}
