import '../../domain/requests/prediction_request.dart';
import '../models/forecast_day_model.dart';

extension ForecastResponseMapper on ForecastDayModel? {
  PredictionRequest getFeaturesValues() {
    return PredictionRequest(features: [
      this!.day.dailyChanceOfRain > 50 ? 1 : 0,
      this!.day.condition.text == "Sunny" ? 1 : 0,
      this!.day.avgtempC > 50 ? 1 : 0,
      this!.day.avgtempC > 50 ? 0 : 1,
      this!.day.avghumidity > 50 ? 1 : 0
    ]);
  }
}
