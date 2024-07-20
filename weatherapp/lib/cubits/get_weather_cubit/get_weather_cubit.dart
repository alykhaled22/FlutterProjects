import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_api.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  Future getCurrentWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherApi(dio: Dio()).getWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}


/*
-create states
-create cubit 
-create function
-provide cubit
-integrate cubit
-trigger cubit
*/
