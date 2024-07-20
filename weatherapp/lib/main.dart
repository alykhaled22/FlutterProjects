import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  useMaterial3: false, //to fix the bug of theme not changing
                  primarySwatch: getWeatherColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition,
                  )),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
    case "Blowing snow":
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan;
    case "Patchy rain possible":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Light rain shower":
    case "Patchy light rain with thunder":
    case "Partly cloudy":
      return Colors.lightBlue;
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Moderate or heavy rain with thunder":
      return Colors.blue;
    case "Patchy snow possible":
    case "Patchy light snow":
    case "Light snow":
    case "Light snow showers":
    case "Patchy light snow with thunder":
    case "Moderate snow":
    case "Patchy moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Moderate or heavy snow showers":
    case "Moderate or heavy snow with thunder":
    case "Patchy sleet possible":
    case "Light sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet":
    case "Moderate or heavy sleet showers":
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.blueGrey;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Blizzard":
      return Colors.indigo;
    default:
      return Colors.blue;
  }
}
