import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherInfoDetails extends StatefulWidget {
  final String dailyForecast;
  const WeatherInfoDetails({Key? key, required this.dailyForecast}) : super(key: key);

  @override
  _WeatherInfoDetailsState createState() => _WeatherInfoDetailsState();
}

class _WeatherInfoDetailsState extends State<WeatherInfoDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather list for 3 days'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.teal,
                  Colors.cyan,
                ],
              )
          ),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.teal,
                  Colors.cyan,
                ],
              )
          ),
        child: const Center(
          child: Text('Нужно подписаться на ежедневную погоду на сайте OpenWeatherMap, чтобы отобразить погоду по дням',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
