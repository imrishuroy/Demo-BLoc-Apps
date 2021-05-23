import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:counter_bloc/models/models.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeatherEvent) {
      yield WeatherLoaing();
      final _weather = await _fetchWeather(event.cityName);
      yield WeatherLoaded(_weather);
    }
  }

  Future<Weather> _fetchWeather(String cityName) async {
    return Future.delayed(Duration(seconds: 1), () {
      return Weather(
        cityName: cityName,
        temp: 30 + Random().nextInt(15) + Random().nextDouble(),
      );
    });
  }
}
