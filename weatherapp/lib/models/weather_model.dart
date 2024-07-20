class WeatherModel {
  final String cityName;
  final DateTime updatedTime;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String icon;

  WeatherModel({
    required this.icon,
    required this.cityName,
    required this.updatedTime,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      icon: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      cityName: json["location"]["name"],
      updatedTime: DateTime.parse(json["current"]["last_updated"]),
      avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      condition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
