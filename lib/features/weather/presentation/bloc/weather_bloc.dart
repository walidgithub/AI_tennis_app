import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/domain/requests/location_request.dart';
import 'package:weather_app/features/weather/domain/requests/prediction_request.dart';
import 'package:weather_app/features/weather/domain/usecases/get_prediction_usecase.dart';
import '../../../../core/utils/enums/RequestState.dart';
import '../../data/models/forecast_day_model.dart';
import '../../data/models/prediction_model.dart';
import '../../domain/usecases/get_weather_usecase.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final GetPredictionUseCase getPredictionUseCase;

  WeatherBloc(this.getWeatherUseCase, this.getPredictionUseCase)
      : super(const WeatherState()) {
    on<GetWeatherEvent>(_login);
    on<GetPredictionEvent>(_getPrediction);
  }

  FutureOr<void> _login(
      GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(
        weatherState: RequestState.loading, stateList: [], weatherMessage: ""));
    final result = await getWeatherUseCase(event.locationRequest);
    result.fold(
        (l) => emit(state.copyWith(
            weatherState: RequestState.error,
            stateList: [],
            weatherMessage: l.message)),
        (r) => emit(state.copyWith(
              stateList: r,
              weatherState: RequestState.done,
            )));
  }

  FutureOr<void> _getPrediction(
      GetPredictionEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(
        weatherState: RequestState.loading,
        predictionResult: const PredictionModel(prediction: [0]),
        weatherMessage: ""));
    final result = await getPredictionUseCase(event.predictionRequest);
    result.fold(
        (l) => emit(state.copyWith(
            weatherState: RequestState.error,
            predictionResult: const PredictionModel(prediction: [0]),
            weatherMessage: l.message)),
        (r) => emit(state.copyWith(
              predictionResult: r,
              weatherState: RequestState.done,
            )));
  }
}
