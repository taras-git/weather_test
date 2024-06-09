import 'package:flutter/material.dart';

class WeatherFail extends StatelessWidget {
  const WeatherFail({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: Text(
              'Sorry, the search is not valid, please check the city name',
              style: theme.textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
