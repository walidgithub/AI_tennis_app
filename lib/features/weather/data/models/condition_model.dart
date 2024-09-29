class ConditionModel {
  ConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });
  late final String text;
  late final String icon;
  late final int code;

  ConditionModel.fromJson(Map<String, dynamic> json){
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['icon'] = icon;
    _data['code'] = code;
    return _data;
  }
}