class AstroModel {
  AstroModel({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });
  late final String sunrise;
  late final String sunset;
  late final String moonrise;
  late final String moonset;
  late final String moonPhase;
  late final int moonIllumination;
  late final int isMoonUp;
  late final int isSunUp;

  AstroModel.fromJson(Map<String, dynamic> json){
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['moonrise'] = moonrise;
    _data['moonset'] = moonset;
    _data['moon_phase'] = moonPhase;
    _data['moon_illumination'] = moonIllumination;
    _data['is_moon_up'] = isMoonUp;
    _data['is_sun_up'] = isSunUp;
    return _data;
  }
}