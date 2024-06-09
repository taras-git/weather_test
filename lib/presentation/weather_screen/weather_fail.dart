import 'package:flutter/material.dart';

class WeatherFail extends StatelessWidget {
  const WeatherFail({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sorry, the search is not valid, please check the city name',
            style: theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
