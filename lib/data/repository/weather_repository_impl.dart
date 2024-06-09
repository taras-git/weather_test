import 'package:weather_app/api_service/api_client.dart';

import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  @override
  Future<WeatherModel> getCurrentWeather(String city) async {
    final currentWeather = await _apiClient.getWeather(city: city);

    return WeatherModel(
      temperature: currentWeather.main!.temp!,
      location: currentWeather.name!,
      condition: currentWeather.weather![0].main!,
    );
  }
}
