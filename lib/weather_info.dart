
import 'package:flutter/material.dart';
import 'package:flutter_weather_days/services.dart';
import 'package:flutter_weather_days/weather_info_details.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models.dart';

class WeatherInfoScreen extends StatefulWidget {
  final String city;
  const WeatherInfoScreen({required this.city, Key? key} ) : super(key: key);

  @override
  _WeatherInfoScreenState createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {

  final _dataService = DataService();
  WeatherResponse? _response;

  Future search() async {
    final response = await _dataService.getWeather(city: widget.city);
    setState(() => _response = response);
  }

  @override
  void initState() {
    search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: search(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          if(_response != null) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Center(child: Text('Weather Forecast')),
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
                actions: [
                  IconButton(
                      onPressed: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WeatherInfoDetails(dailyForecast: widget.city))
                        );
                      },
                      icon: const Icon(Icons.info)
                  ),
                ],
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
                child: Center(
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(_response!.cityName.toUpperCase(),
                                    style: GoogleFonts.montserrat(fontSize: 25),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    '${_response!.tempInfo.temperature} °',
                                    style: GoogleFonts.rubikMoonrocks(fontSize: 50),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.network(_response!.iconUrl),
                                  Text(_response!.weatherInfo.description),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                        const Text('Detailed information', style: TextStyle(fontSize: 20),),
                        const Divider(thickness: 1, color: Colors.black,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.water_drop_outlined,),
                                Text('${_response!.humidityInfo.humidity}%'),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.air),
                                Text('${_response!.speedInfo.speed} km/h'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.tire_repair_outlined),
                                Text('${_response!.pressureInfo.pressure} mb'),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.visibility),
                                Text('${_response!.visibilityInfo.visibility} m'),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

