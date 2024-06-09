import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/data/model/enums.dart';
import 'package:weather_app/data/model/weather_model.dart';

class WeatherSuccess extends StatelessWidget {
  const WeatherSuccess({
    required this.weather,
    required this.units,
    required this.onRefresh,
    super.key,
  });

  final WeatherModel weather;
  final TemperatureUnit units;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCelsius = BlocProvider.of<WeatherBloc>(context).isCelsius();
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            clipBehavior: Clip.none,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${weather.location.city}, ${weather.location.country}',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  weather.formattedTemperature(
                    isCelsius,
                  ),
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

extension on WeatherModel {
  String formattedTemperature(bool isCelsius) {
    final temperatureValue =
        '${isCelsius ? temperature.toStringAsPrecision(2) : (temperature * 1.8 + 32).toStringAsPrecision(2)}°';

    final celsiusOrFahrenheit = isCelsius ? 'C' : 'F';

    return '$temperatureValue $celsiusOrFahrenheit';
  }
}
