import 'package:flutter/material.dart';
import 'package:flutter_weather_days/weather_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: 250,
                      child: TextField(
                          controller: cityTextController,
                          decoration: InputDecoration(
                              labelText: 'City',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => WeatherInfoScreen(city: cityTextController.text,)
                              ),
                          );
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),
                        ),
                        child: const Text('Search')
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}

