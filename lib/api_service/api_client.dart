import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/response/current_weather/current_weather.dart';

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class ApiClient {
  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'api.openweathermap.org';
  static const _path = 'data/2.5/weather';
  // ignore: do_not_use_environment
  static const appid = String.fromEnvironment('APPID');

  Future<CurrentWeather> getWeather({
    required String city,
  }) async {
    final weatherRequest = Uri.https(
      _baseUrl,
      _path,
      {
        'q': city,
        'appid': appid,
        'units': 'metric',
      },
    );

    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('weather')) {
      throw WeatherNotFoundFailure();
    }

    return CurrentWeather.fromJson(bodyJson);
  }
}
