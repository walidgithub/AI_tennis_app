import 'condition_model.dart';

class DayModel {
  DayModel({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });
  late final double maxtempC;
  late final double maxtempF;
  late final double mintempC;
  late final double mintempF;
  late final double avgtempC;
  late final int? avgtempF;
  late final double maxwindMph;
  late final int? maxwindKph;
  late final int? totalprecipMm;
  late final int totalprecipIn;
  late final int totalsnowCm;
  late final int avgvisKm;
  late final int avgvisMiles;
  late final int avghumidity;
  late final int dailyWillItRain;
  late final int dailyChanceOfRain;
  late final int dailyWillItSnow;
  late final int dailyChanceOfSnow;
  late final ConditionModel condition;
  late final int uv;

  DayModel.fromJson(Map<String, dynamic> json){
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = (json['avgtemp_f'] as num).toInt();
    maxwindMph = json['maxwind_mph'];
    maxwindKph = (json['maxwind_kph'] as num).toInt();
    totalprecipMm = (json['totalprecip_mm'] as num).toInt();
    totalprecipIn = (json['totalprecip_in'] as num).toInt();
    totalsnowCm = (json['totalsnow_cm'] as num).toInt();
    avgvisKm = (json['avgvis_km'] as num).toInt();
    avgvisMiles = (json['avgvis_miles'] as num).toInt();
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = ConditionModel.fromJson(json['condition']);
    uv = (json['uv'] as num).toInt();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['maxtemp_c'] = maxtempC;
    _data['maxtemp_f'] = maxtempF;
    _data['mintemp_c'] = mintempC;
    _data['mintemp_f'] = mintempF;
    _data['avgtemp_c'] = avgtempC;
    _data['avgtemp_f'] = avgtempF;
    _data['maxwind_mph'] = maxwindMph;
    _data['maxwind_kph'] = maxwindKph;
    _data['totalprecip_mm'] = totalprecipMm;
    _data['totalprecip_in'] = totalprecipIn;
    _data['totalsnow_cm'] = totalsnowCm;
    _data['avgvis_km'] = avgvisKm;
    _data['avgvis_miles'] = avgvisMiles;
    _data['avghumidity'] = avghumidity;
    _data['daily_will_it_rain'] = dailyWillItRain;
    _data['daily_chance_of_rain'] = dailyChanceOfRain;
    _data['daily_will_it_snow'] = dailyWillItSnow;
    _data['daily_chance_of_snow'] = dailyChanceOfSnow;
    _data['condition'] = condition.toJson();
    _data['uv'] = uv;
    return _data;
  }
}