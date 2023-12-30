part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final bool isByLocation;
  final Position position;
  final String cityName;

  const FetchWeather.byLocation({
    required this.position,
  })  : isByLocation = true,
        cityName = '';

  FetchWeather.byCityName({
    required this.cityName,
  })  : isByLocation = false,
        position = Position(
          latitude: 0.0,
          longitude: 0.0,
          timestamp: DateTime.now(),
          accuracy: 0.0,
          altitude: 0.0,
          heading: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        );

  @override
  List<Object> get props => [isByLocation, position, cityName];
}
