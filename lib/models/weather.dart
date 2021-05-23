import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temp;

  Weather({
    required this.cityName,
    required this.temp,
  });

  @override
  List<Object?> get props => [cityName, temp];
}
