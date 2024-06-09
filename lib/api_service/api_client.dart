import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/response/current_weather/current_weather.dart';

class LocationRequestFailure implements Exception {}

class LocationNotFoundFailure implements Exception {}

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class ApiClient {
  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'api.openweathermap.org';
  static const _path = 'data/2.5/weather';

  /// Fetches [Weather] for a given [City]
  Future<CurrentWeather> getWeather({
    required String city,
  }) async {
    final weatherRequest = Uri.https(
      _baseUrl,
      _path,
      {
        'city': city,
        'appid': '70ab0584fe21e1097ca75aa108e8f5b1',
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
