import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather/weather.dart';
import 'package:weather_app/data/api_key.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(
          OPENWEATHER_API_KEY,
        );

        Weather weather;
        if (event.isByLocation) {
          weather = await wf.currentWeatherByLocation(
            event.position.latitude,
            event.position.longitude,
          );
        } else {
          weather = await wf.currentWeatherByCityName(event.cityName);
        }

        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}
