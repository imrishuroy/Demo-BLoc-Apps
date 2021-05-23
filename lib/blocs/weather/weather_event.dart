part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;

  GetWeatherEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}
