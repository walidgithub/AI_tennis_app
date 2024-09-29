import 'astro_model.dart';
import 'day_model.dart';
import 'hour_model.dart';

class ForecastDayModel {
  ForecastDayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });
  late final String date;
  late final int dateEpoch;
  late final DayModel day;
  late final AstroModel astro;
  late final List<HourModel> hour;

  ForecastDayModel.fromJson(Map<String, dynamic> json){
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = DayModel.fromJson(json['day']);
    astro = AstroModel.fromJson(json['astro']);
    hour = List.from(json['hour']).map((e)=>HourModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['date_epoch'] = dateEpoch;
    _data['day'] = day.toJson();
    _data['astro'] = astro.toJson();
    _data['hour'] = hour.map((e)=>e.toJson()).toList();
    return _data;
  }
}