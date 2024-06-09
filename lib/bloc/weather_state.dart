part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  failed,
}

class WeatherState extends Equatable {
  const WeatherState({
    this.weatherStatus = WeatherStatus.initial,
    this.weather,
    this.temperatureUnit = TemperatureUnit.celsius,
  });

  final WeatherStatus weatherStatus;
  final WeatherModel? weather;
  final TemperatureUnit temperatureUnit;

  WeatherState copyWith({
    WeatherStatus? weatherStatus,
    WeatherModel? weather,
    TemperatureUnit? temperatureUnit,
  }) {
    return WeatherState(
      weatherStatus: weatherStatus ?? this.weatherStatus,
      weather: weather ?? this.weather,
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
    );
  }

  @override
  List<Object?> get props => [
        weatherStatus,
        weather,
        temperatureUnit,
      ];
}
