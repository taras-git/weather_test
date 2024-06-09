import 'package:weather_app/data/model/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getCurrentWeather(String city);
}
