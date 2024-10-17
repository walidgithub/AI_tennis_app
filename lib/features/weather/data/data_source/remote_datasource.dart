import 'package:weather_app/features/weather/data/models/forecast_day_model.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_manager.dart';
import '../../domain/requests/location_request.dart';
import '../../domain/requests/prediction_request.dart';
import '../models/prediction_model.dart';

abstract class BaseDataSource {
  Future<List<ForecastDayModel>> getWeather(LocationRequest locationRequest);
  Future<PredictionModel> getPrediction(PredictionRequest predictionRequest);
}

class WeatherDataSource extends BaseDataSource {
  final DioManager _dio;

  WeatherDataSource(this._dio);

  @override
  Future<List<ForecastDayModel>> getWeather(LocationRequest locationRequest) async {
    List<ForecastDayModel> res = <ForecastDayModel>[];
    try {
      return await _dio.get('${ApiConstants.baseUrl}${locationRequest.city}%2C%20${locationRequest.country}&days=${ApiConstants.daysCount}&key=${ApiConstants.apiKey}').then((response) {
        res = (response.data['forecast']['forecastday'] as List).map((e) {
          return ForecastDayModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }

  @override
  Future<PredictionModel> getPrediction(PredictionRequest predictionRequest) async {
    try {
    final prediction = await _dio.post("http://192.168.90.102:5001/predict",
          body: predictionRequest.toJson());
    PredictionModel predictRes = prediction.data["prediction"];
    return predictRes;
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }
}