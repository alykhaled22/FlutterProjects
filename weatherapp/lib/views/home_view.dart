import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/widgets/noweather.dart';
import 'package:weatherapp/widgets/weather_failure.dart';
import 'package:weatherapp/widgets/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeather();
          } else if (state is WeatherLoadedState) {
            return WeatherInfo(weatherModel: state.weatherModel);
            //or
            //var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
            //return WeatherInfo(weatherModel:weatherModel);/
          } else {
            return const WeatherFailure();
          }
        },
      ),
    );
  }
}

