import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/data/models/forecast_day_model.dart';
import '../../../../core/base_usecase/base_usecase.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/prediction_model.dart';
import '../repository/weather_repo.dart';

class GetPredictionUseCase
    extends BaseUsecase {
  final WeatherRepository weatherRepository;

  GetPredictionUseCase(this.weatherRepository);

  @override
  Future<Either<Failure, PredictionModel>> call(parameters) async {
    return await weatherRepository.getPrediction(parameters);
  }
}