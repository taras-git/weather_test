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
  }

  final WeatherRepositoryImpl weatherRepository;

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
      final weather = await weatherRepository.getCurrentWeather(event.city);
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
}
