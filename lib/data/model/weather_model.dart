import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final String location;
  final double temperature;
  final String condition;

  const WeatherModel({
    required this.location,
    required this.temperature,
    required this.condition,
  });

  @override
  List<Object?> get props => [
        location,
        temperature,
        condition,
      ];
}
