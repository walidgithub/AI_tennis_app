import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/requests/location_request.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/forecast_day_model.dart';
import '../requests/prediction_request.dart';

abstract class WeatherRepository {
  Future<Either<Failure, List<ForecastDayModel>>> getWeather(
      LocationRequest locationRequest);

  Future<Either<Failure, List<int>>> getPrediction(PredictionRequest predictionRequest);
}