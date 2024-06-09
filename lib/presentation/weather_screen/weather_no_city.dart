import 'package:flutter/material.dart';

class WeatherNoCity extends StatelessWidget {
  const WeatherNoCity({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Please search for a City',
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
