part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final RequestState weatherState;
  final List<ForecastDayModel> stateList;
  final String weatherMessage;

  const WeatherState({
    this.weatherState = RequestState.loading,
    this.stateList = const [],
    this.weatherMessage = '',
  });

  WeatherState copyWith({
    RequestState? weatherState,
    List<ForecastDayModel>? stateList,
    String? weatherMessage,
  }) {
    return WeatherState(
        weatherState: weatherState ?? this.weatherState,
        stateList: stateList ?? this.stateList,
        weatherMessage: weatherMessage ?? this.weatherMessage);
  }

  @override
  List<Object?> get props => [weatherState, stateList, weatherMessage];
}