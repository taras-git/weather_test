import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';
import 'package:weather_app/presentation/search_screen/search_screen.dart';
import 'package:weather_app/presentation/weather_screen/weather_fail.dart';
import 'package:weather_app/presentation/weather_screen/weather_load.dart';
import 'package:weather_app/presentation/weather_screen/weather_no_city.dart';
import 'package:weather_app/presentation/weather_screen/weather_success.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(context.read<WeatherRepositoryImpl>()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({
    super.key,
  });

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  Future<void> getRefresh() async {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? city;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
        actions: [
          GestureDetector(
            onTap: () async {
              final isCelsius =
                  BlocProvider.of<WeatherBloc>(context).isCelsius();
              context
                  .read<WeatherBloc>()
                  .add(ToggleTemperetureEvent(isCelsius: !isCelsius));
              BlocProvider.of<WeatherBloc>(context).setCelsius(!isCelsius);
            },
            child: const Row(
              children: [
                Icon(Icons.thermostat_sharp),
                Text('°C/°F'),
              ],
            ),
          ),
          const SizedBox(
            width: 24,
          ),
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
                city = input;
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
                      if (city != null) {
                        context.read<WeatherBloc>().add(
                              GetWeatherEvent(city: city!),
                            );
                      }
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
