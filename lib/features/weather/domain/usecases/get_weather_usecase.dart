import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/data/models/forecast_day_model.dart';
import '../../../../core/base_usecase/base_usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/weather_repo.dart';

class GetWeatherUseCase
    extends BaseUsecase {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase(this.weatherRepository);

  @override
  Future<Either<Failure, List<ForecastDayModel>>> call(parameters) async {
    return await weatherRepository.getWeather(parameters);
  }
}