import 'package:weather_app/features/weather/data/models/forecast_day_model.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_manager.dart';
import '../../domain/requests/location_request.dart';

abstract class BaseDataSource {
  Future<List<ForecastDayModel>> getWeather(LocationRequest locationRequest);
}

class WeatherDataSource extends BaseDataSource {
  final DioManager _dio;

  WeatherDataSource(this._dio);

  @override
  Future<List<ForecastDayModel>> getWeather(LocationRequest locationRequest) async {
    List<ForecastDayModel> res = <ForecastDayModel>[];
    try {
      return await _dio.get('${ApiConstants.baseUrl}${locationRequest.city}%2C%20${locationRequest.country}&days=4&key=${ApiConstants.apiKey}').then((response) {
        res = (response.data['forecast']['forecastday'] as List).map((e) {
          return ForecastDayModel.fromJson(e);
        }).toList();
        return res;
      });
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }
}