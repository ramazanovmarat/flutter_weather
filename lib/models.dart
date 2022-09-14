class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;
  final int humidity;
  final int pressure;

  TemperatureInfo({required this.pressure, required this.humidity, required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final humidity = json['humidity'];
    final pressure = json['pressure'];
    return TemperatureInfo(temperature: temperature, humidity: humidity, pressure: pressure);
  }
}

class WindInfo {
  final double speed;
  
  WindInfo({required this.speed});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];
    return WindInfo(speed: speed);
  }
}

class VisibilityInfo {
  final int visibility;

  VisibilityInfo({required this.visibility});
  
  factory VisibilityInfo.fromJson(Map<String, dynamic> json) {
    final visibility = json['visibility'];
    return VisibilityInfo(visibility: visibility);
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo, humidityInfo, pressureInfo;
  final WeatherInfo weatherInfo;
  final WindInfo speedInfo;
  final VisibilityInfo visibilityInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({
      required this.visibilityInfo,
      required this.pressureInfo,
      required this.speedInfo,
      required this.humidityInfo,
      required this.cityName,
      required this.tempInfo,
      required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final humidityInfoJson = json['main'];
    final humidityInfo = TemperatureInfo.fromJson(humidityInfoJson);

    final pressureInfoJson = json['main'];
    final pressureInfo = TemperatureInfo.fromJson(pressureInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final windInfoJson = json['wind'];
    final speedInfo = WindInfo.fromJson(windInfoJson);

    final visibilityInfoJson = json['visibility'];
    final visibilityInfo = VisibilityInfo(visibility: visibilityInfoJson);

    return WeatherResponse(
        visibilityInfo: visibilityInfo,
        pressureInfo: pressureInfo,
        cityName: cityName,
        tempInfo: tempInfo,
        weatherInfo: weatherInfo,
        humidityInfo: humidityInfo,
        speedInfo: speedInfo,
    );
  }
}