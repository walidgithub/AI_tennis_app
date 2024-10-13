import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/data/data_source/remote_datasource.dart';
import 'package:weather_app/features/weather/data/models/forecast_day_model.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/weather_repo.dart';
import '../../domain/requests/location_request.dart';
import '../../domain/requests/prediction_request.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDataSource _weatherDataSource;
  final NetworkInfo _networkInfo;

  WeatherRepositoryImpl(
    this._weatherDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<ForecastDayModel>>> getWeather(LocationRequest locationRequest) async {
    try {
      if (await _networkInfo.isConnected) {
        final result = await _weatherDataSource
            .getWeather(locationRequest);
        return Right(result);
      } else {
        return Left(ErrorHandler.handle("NoInternet").failure);
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<int>>> getPrediction(PredictionRequest predictionRequest) async {
    try {
      if (await _networkInfo.isConnected) {
        final result = await _weatherDataSource
            .getPrediction(predictionRequest);
        return Right(result);
      } else {
        return Left(ErrorHandler.handle("NoInternet").failure);
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
