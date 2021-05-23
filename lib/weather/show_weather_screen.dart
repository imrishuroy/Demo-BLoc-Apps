import 'package:counter_bloc/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowWeatherScreen extends StatelessWidget {
  final _cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        bloc: _weatherBloc,
        listener: (context, state) {
          if (state is WeatherLoaded) {
            print(state.weather.cityName);
          }
        },
        builder: (context, state) {
          return Center(
            child: state is WeatherLoaing
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.0),
                      if (state is WeatherInitial) SizedBox(height: 70),
                      Text(
                        '${state is WeatherLoaded ? '${state.weather.cityName}' : ''}',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '${state is WeatherLoaded ? '${state.weather.temp.toStringAsFixed(2)} °C' : " "}',
                        style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextField(
                          controller: _cityNameController,
                          decoration: InputDecoration(
                            hintText: 'Enter City Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            suffix: InkWell(
                              onTap: () async => _weatherBloc.add(
                                GetWeatherEvent(
                                  _cityNameController.text,
                                ),
                              ),
                              child: Icon(
                                Icons.search,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
