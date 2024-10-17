part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends WeatherEvent{
  final LocationRequest locationRequest;

  const GetWeatherEvent(this.locationRequest);

  List<Object> get props => [locationRequest];
}

class GetPredictionEvent extends WeatherEvent{
  final PredictionRequest predictionRequest;

  const GetPredictionEvent(this.predictionRequest);

  List<Object> get props => [predictionRequest];
}