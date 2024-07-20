import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherApi {
  final Dio dio;

  WeatherApi({required this.dio});

  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "8bb5cf685a954dbda02120658241607";

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      final response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1",
      );

      WeatherModel weather = WeatherModel.fromJson(response.data);

      return weather;
    } on DioException catch (e) {
      final String errMsg = e.response?.data["error"]["message"] ??
          "Oops there was an error, try again later";
      throw Exception(errMsg);
    } catch (e) {
      throw Exception("Oops there was an error, try again later");
    }
  }
}
