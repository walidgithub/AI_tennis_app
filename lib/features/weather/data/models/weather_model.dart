import 'current_model.dart';
import 'forecast_model.dart';
import 'location_model.dart';

class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });
  late final LocationModel location;
  late final CurrentModel current;
  late final ForecastModel forecast;

  WeatherModel.fromJson(Map<String, dynamic> json){
    location = LocationModel.fromJson(json['location']);
    current = CurrentModel.fromJson(json['current']);
    forecast = ForecastModel.fromJson(json['forecast']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    _data['forecast'] = forecast.toJson();
    return _data;
  }
}