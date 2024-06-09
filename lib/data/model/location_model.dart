import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  const LocationModel({
    required this.city,
    required this.country,
  });

  final String city;
  final String country;

  @override
  List<Object?> get props => [
        city,
        country,
      ];
}
