import 'package:flutter/material.dart';
import 'package:weather_app/components/my_chart_days_column.dart';
import 'package:weather_app/components/my_page_view.dart';
import 'package:weather_app/components/my_text_field.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/loading_or_register.dart';
import 'package:weather_app/pages/pads/current_weather_info_pad.dart';
import 'package:weather_app/pages/pads/current_weather_pad.dart';
import 'package:weather_app/pages/pads/forecast_hours_weather_pad.dart';
import 'package:weather_app/pages/pads/forecast_hours_weather_pad2.dart';

class WeatherPage extends StatefulWidget {
  final Weather weather;
  WeatherPage({super.key, required this.weather});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    _textController.text = widget.weather.cityName;
  }

  final TextEditingController _textController = TextEditingController();
  final PageController _pageController = PageController();
  final PageController _pageController2 = PageController();
  final winddirections = [
    "north",
    "north-east",
    "east",
    "south-east",
    "south",
    "south-west",
    "west",
    "north-west"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: MyTextField(
              controller: _textController,
              hintText: "write city",
              obscureText: false),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.arrow_right_sharp,
                size: 46,
              ),
              tooltip: 'check weather',
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (cotext) => LoadingOrWeather(
                              cityName: _textController.text)));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Write correct city")));
                }
              },
            ),
          ]),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          const SizedBox(height: 20),
          const Text("Right now", style: TextStyle(fontSize: 26)),
          Text(widget.weather.description, style: TextStyle(fontSize: 18)),
          Text(
              "${widget.weather.windSpeed} m/s winds from ${winddirections[((widget.weather.windDeg + 22.5) / 45 % 8).toInt()]}"),
          MyPageView(
            pageController: _pageController,
            height: 200,
            widgets: [
              CurrentWeatherPad(weather: widget.weather),
              CurrentWeatherInfoPad(weather: widget.weather)
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Text('This morning ', style: TextStyle(fontSize: 26)),
              Text('(${widget.weather.hourForecast[8].time.substring(11, 16)})',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
          Text('${widget.weather.hourForecast[8].mainCondition}',
              style: TextStyle(fontSize: 18)),
          SizedBox(height: 24),
          MyPageView(
            pageController: _pageController2,
            height: 256,
            widgets: [
              ForecastHourPad(weather: widget.weather),
              ForecastHourPad2(weather: widget.weather),
            ],
          ),
          SizedBox(height: 32),
          MyColumnDaysDiagram(weather: widget.weather.daysforecast)
        ],
      ),
    );
  }
}
