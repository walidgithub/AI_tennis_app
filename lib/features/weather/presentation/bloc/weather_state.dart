part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final RequestState weatherState;
  final List<ForecastDayModel> stateList;
  final PredictionModel predictionResult;
  final String weatherMessage;

  const WeatherState({
    this.weatherState = RequestState.loading,
    this.stateList = const [],
    this.predictionResult = const PredictionModel(prediction: [0]),
    this.weatherMessage = '',
  });

  WeatherState copyWith({
    RequestState? weatherState,
    List<ForecastDayModel>? stateList,
    PredictionModel? predictionResult,
    String? weatherMessage,
  }) {
    return WeatherState(
        weatherState: weatherState ?? this.weatherState,
        stateList: stateList ?? this.stateList,
        predictionResult: predictionResult ?? this.predictionResult,
        weatherMessage: weatherMessage ?? this.weatherMessage);
  }

  @override
  List<Object?> get props =>
      [weatherState, stateList, predictionResult, weatherMessage];
}
