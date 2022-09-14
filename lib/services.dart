import 'dart:convert';
import 'models.dart';
import 'package:http/http.dart' as http;

class DataService {

  // Получение погоды
  Future<WeatherResponse> getWeather({required String city}) async {

    final queryParameters = {
      'q': city,
      'appid': '1d7e0e34ea029af590e065cbc52462d4',
      'units': 'metric',
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }

  // получение списка погоды на 3 дня
  Future<List<WeatherResponse>> getWeatherDayList(String city) async {
    final queryParameters = {
      'q' : city,
      'cnt' : 3,
      'appid' : '1d7e0e34ea029af590e065cbc52462d4',
      'units' : 'metric'
    };

    final uri = Uri.https(
      'api.openweathermap.org', '/data/2.5/forecast/daily', queryParameters);

    final response = await http.get(uri);
      final json = jsonDecode(response.body);
      final List<WeatherResponse> data = (json['list'] as List<dynamic>)
          .map((item) {
        return WeatherResponse.fromJson(item);
      }).toList();
      return data;
  }
}