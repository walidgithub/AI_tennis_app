part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends WeatherEvent{
  final LocationRequest locationRequest;

  GetWeatherEvent(this.locationRequest);

  List<Object> get props => [locationRequest];
}