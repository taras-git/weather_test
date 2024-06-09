import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/model/enums.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.weatherRepository) : super(const WeatherState()) {
    on<GetWeatherEvent>(_getWeatherEvent);
    on<ToggleTemperetureEvent>(_toggleTemperetureEvent);
  }

  final WeatherRepositoryImpl weatherRepository;

  bool? _isCelsius;

  bool isCelsius() => _isCelsius ?? true;
  bool setCelsius(bool flag) => _isCelsius = flag;

  Future<void> _getWeatherEvent(
    GetWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(
      state.copyWith(
        weatherStatus: WeatherStatus.loading,
      ),
    );

    try {
      final weather = await weatherRepository.getCurrentWeather(
        event.city,
      );

      emit(
        state.copyWith(
          weatherStatus: WeatherStatus.success,
          weather: weather,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          weatherStatus: WeatherStatus.failed,
        ),
      );
    }
  }

  FutureOr<void> _toggleTemperetureEvent(
    ToggleTemperetureEvent event,
    Emitter<WeatherState> emit,
  ) {
    emit(
      state.copyWith(
        isCelsius: !event.isCelsius,
      ),
    );
  }
}
