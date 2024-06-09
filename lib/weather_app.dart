import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';
import 'package:weather_app/presentation/weather_screen/weather_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    required WeatherRepositoryImpl weatherRepository,
    super.key,
  }) : _weatherRepository = weatherRepository;

  final WeatherRepositoryImpl _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: const WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
}
