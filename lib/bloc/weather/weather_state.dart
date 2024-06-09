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
    this.isCelsius = true,
  });

  final WeatherStatus weatherStatus;
  final WeatherModel? weather;
  final TemperatureUnit temperatureUnit;
  final bool isCelsius;

  WeatherState copyWith({
    WeatherStatus? weatherStatus,
    WeatherModel? weather,
    TemperatureUnit? temperatureUnit,
    bool? isCelsius,
  }) {
    return WeatherState(
      weatherStatus: weatherStatus ?? this.weatherStatus,
      weather: weather ?? this.weather,
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
      isCelsius: isCelsius ?? this.isCelsius,
    );
  }

  @override
  List<Object?> get props => [
        weatherStatus,
        weather,
        temperatureUnit,
        isCelsius,
      ];
}
