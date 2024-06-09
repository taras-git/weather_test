import 'package:flutter/material.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';
import 'package:weather_app/weather_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    WeatherApp(
      weatherRepository: WeatherRepositoryImpl(),
    ),
  );
}
