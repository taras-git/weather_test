import 'package:equatable/equatable.dart';
import 'package:weather_app/data/model/location_model.dart';

class WeatherModel extends Equatable {
  const WeatherModel({
    required this.location,
    required this.temperature,
    required this.condition,
  });

  final LocationModel location;
  final double temperature;
  final String condition;

  @override
  List<Object?> get props => [
        location,
        temperature,
        condition,
      ];
}
