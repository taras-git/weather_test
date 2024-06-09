import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  const WeatherModel({
    required this.location,
    required this.temperature,
    required this.condition,
  });

  final String location;
  final double temperature;
  final String condition;

  @override
  List<Object?> get props => [
        location,
        temperature,
        condition,
      ];
}
