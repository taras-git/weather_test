part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeatherEvent extends WeatherEvent {
  const GetWeatherEvent({
    required this.city,
  });

  final String city;

  @override
  List<Object?> get props => [city];
}

class ToggleTemperetureEvent extends WeatherEvent {
  const ToggleTemperetureEvent({
    required this.isCelsius,
  });

  final bool isCelsius;

  @override
  List<Object?> get props => [isCelsius];
}
