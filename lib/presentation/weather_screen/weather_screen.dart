import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';
import 'package:weather_app/presentation/search_screen/search_screen.dart';
import 'package:weather_app/presentation/weather_screen/weather_fail.dart';
import 'package:weather_app/presentation/weather_screen/weather_load.dart';
import 'package:weather_app/presentation/weather_screen/weather_no_city.dart';
import 'package:weather_app/presentation/weather_screen/weather_success.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(context.read<WeatherRepositoryImpl>()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  Future<void> getRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final input = await Navigator.of(context).push(
                SearchScreen.route(),
              );
              if (mounted && input != null) {
                context.read<WeatherBloc>().add(
                      GetWeatherEvent(city: input),
                    );
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.weatherStatus) {
                case WeatherStatus.initial:
                  return const WeatherNoCity();
                case WeatherStatus.failed:
                  return const WeatherFail();
                case WeatherStatus.loading:
                  return const WeatherLoading();
                case WeatherStatus.success:
                  return WeatherSuccess(
                    weather: state.weather!,
                    units: state.temperatureUnit,
                    onRefresh: () async {
                      return getRefresh();
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
