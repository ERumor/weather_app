import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/utils/weather_icon.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/ui/widgets/appbar_home.dart';
import 'package:weather_app/ui/widgets/gradient_background.dart';
import 'package:weather_app/ui/widgets/max_temp.dart';
import 'package:weather_app/ui/widgets/min_temp.dart';
import 'package:weather_app/ui/widgets/sunrise.dart';
import 'package:weather_app/ui/widgets/sunset.dart';
import 'package:weather_app/ui/widgets/temperature.dart';
import 'package:weather_app/ui/widgets/weather_conditions.dart';
import 'package:weather_app/ui/widgets/date.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.cityName,
  });

  final String cityName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: const AppBarHome(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const GradientBackground(),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Column(children: [
                      GradientBackground(),
                      CircularProgressIndicator(),
                    ]);
                  } else if (state is WeatherSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Temperature(
                            temperature:
                                state.weather.temperature!.celsius!.round(),
                          ),
                          WeatherConditions(
                            weatherMain: state.weather.weatherMain!,
                          ),
                          const SizedBox(height: 5),
                          Date(date: state.weather.date!),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Sunrise(sunrise: state.weather.sunrise!),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 1,
                                width: 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Sunset(sunset: state.weather.sunset!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MaxTemperature(
                                      temperature: state
                                          .weather.tempMax!.celsius!
                                          .round(),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 1,
                                width: 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MinTemperature(
                                      temperature: state
                                          .weather.tempMin!.celsius!
                                          .round(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else if (state is WeatherFailure) {
                    return const Center(
                      child: Text(
                        'Failed to fetch weather data, Perhaps you entered the wrong city name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
