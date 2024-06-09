import 'package:flutter/material.dart';
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
    return Center(
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
            weather.formattedTemperature(units),
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

extension on WeatherModel {
  String formattedTemperature(TemperatureUnit units) {
    return '''${temperature.toStringAsPrecision(2)}° ${units.isCelsius ? 'C' : 'F'}''';
  }
}
