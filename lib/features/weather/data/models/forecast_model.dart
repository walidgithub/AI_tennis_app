import 'forecast_day_model.dart';

class ForecastModel {
  ForecastModel({
    required this.forecastday,
  });
  late final List<ForecastDayModel> forecastday;

  ForecastModel.fromJson(Map<String, dynamic> json){
    forecastday = List.from(json['forecastday']).map((e)=>ForecastDayModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['forecastday'] = forecastday.map((e)=>e.toJson()).toList();
    return _data;
  }
}