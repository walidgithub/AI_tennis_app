class PredictionRequest {
  final List<int> features;
  const PredictionRequest({required this.features});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['features'] = features;
    return data;
  }
}