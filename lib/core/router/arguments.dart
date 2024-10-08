import 'package:weather_app/features/weather/data/models/forecast_day_model.dart';

class WeatherViewArguments {
  String location;
  String username;
  List<ForecastDayModel> forecastDayModelList;
  WeatherViewArguments({required this.location, required this.username, required this.forecastDayModelList});
}