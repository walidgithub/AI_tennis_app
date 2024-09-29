import 'package:weather_app/features/weather/data/models/forecast_day_model.dart';

class WeatherViewArguments {
  String location;
  List<ForecastDayModel> forecastDayModelList;
  WeatherViewArguments({required this.location, required this.forecastDayModelList});
}