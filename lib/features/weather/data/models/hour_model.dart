import 'condition_model.dart';

class HourModel {
  HourModel({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });
  late final int timeEpoch;
  late final String time;
  late final int? tempC;
  late final int? tempF;
  late final int isDay;
  late final ConditionModel condition;
  late final double? windMph;
  late final double? windKph;
  late final int windDegree;
  late final String windDir;
  late final int pressureMb;
  late final double pressureIn;
  late final int? precipMm;
  late final int precipIn;
  late final int snowCm;
  late final int humidity;
  late final int cloud;
  late final double? feelslikeC;
  late final int? feelslikeF;
  late final int? windchillC;
  late final int? windchillF;
  late final double? heatindexC;
  late final int? heatindexF;
  late final int? dewpointC;
  late final double? dewpointF;
  late final int willItRain;
  late final int chanceOfRain;
  late final int willItSnow;
  late final int chanceOfSnow;
  late final int visKm;
  late final int visMiles;
  late final double? gustMph;
  late final double? gustKph;
  late final int uv;

  HourModel.fromJson(Map<String, dynamic> json){
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = (json['temp_c'] as num).toInt();
    tempF = (json['temp_f'] as num).toInt();
    isDay = json['is_day'];
    condition = ConditionModel.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = (json['pressure_mb'] as num).toInt();
    pressureIn = json['pressure_in'];
    precipMm = (json['precip_mm'] as num).toInt();
    precipIn = (json['precip_in'] as num).toInt();
    snowCm = (json['snow_cm'] as num).toInt();
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = (json['feelslike_f'] as num).toInt();
    windchillC = (json['windchill_c'] as num).toInt();
    windchillF = (json['windchill_f'] as num).toInt();
    heatindexC = json['heatindex_c'];
    heatindexF = (json['heatindex_f'] as num).toInt();
    dewpointC = (json['dewpoint_c'] as num).toInt();
    dewpointF = json['dewpoint_f'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    visKm = (json['vis_km'] as num).toInt();
    visMiles = (json['vis_miles'] as num).toInt();
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    uv = (json['uv'] as num).toInt();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['time_epoch'] = timeEpoch;
    _data['time'] = time;
    _data['temp_c'] = tempC;
    _data['temp_f'] = tempF;
    _data['is_day'] = isDay;
    _data['condition'] = condition.toJson();
    _data['wind_mph'] = windMph;
    _data['wind_kph'] = windKph;
    _data['wind_degree'] = windDegree;
    _data['wind_dir'] = windDir;
    _data['pressure_mb'] = pressureMb;
    _data['pressure_in'] = pressureIn;
    _data['precip_mm'] = precipMm;
    _data['precip_in'] = precipIn;
    _data['snow_cm'] = snowCm;
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['feelslike_f'] = feelslikeF;
    _data['windchill_c'] = windchillC;
    _data['windchill_f'] = windchillF;
    _data['heatindex_c'] = heatindexC;
    _data['heatindex_f'] = heatindexF;
    _data['dewpoint_c'] = dewpointC;
    _data['dewpoint_f'] = dewpointF;
    _data['will_it_rain'] = willItRain;
    _data['chance_of_rain'] = chanceOfRain;
    _data['will_it_snow'] = willItSnow;
    _data['chance_of_snow'] = chanceOfSnow;
    _data['vis_km'] = visKm;
    _data['vis_miles'] = visMiles;
    _data['gust_mph'] = gustMph;
    _data['gust_kph'] = gustKph;
    _data['uv'] = uv;
    return _data;
  }
}