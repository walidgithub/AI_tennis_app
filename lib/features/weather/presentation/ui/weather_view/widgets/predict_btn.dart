import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';
import '../../../../../../core/utils/ui_components/primary_button.dart';
import '../../../../data/models/forecast_day_model.dart';

class PredictBtn extends StatelessWidget {
  List<ForecastDayModel> forecastDayModelList;
  int selectedIndex;
  List prediction;
  PredictBtn({super.key, required this.forecastDayModelList, required this.selectedIndex, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        onTap: () async {
          // outlook is rainy
          if (forecastDayModelList[selectedIndex].day.dailyChanceOfRain >
              50) {
            prediction.add(1);
          } else {
            prediction.add(0);
          }
          // outlook is sunny
          if (forecastDayModelList[selectedIndex].day.condition.text == "Sunny") {
            prediction.add(1);
          } else {
            prediction.add(0);
          }
          // temperature is hot
          if (forecastDayModelList[selectedIndex].day.avgtempC >
              50) {
            prediction.add(1);
          } else {
            prediction.add(0);
          }
          // temperature is mild
          if (forecastDayModelList[selectedIndex].day.avgtempC >
              50) {
            prediction.add(0);
          } else {
            prediction.add(1);
          }
          // normal humidity
          if (forecastDayModelList[selectedIndex].day.avghumidity >
              50) {
            prediction.add(1);
          } else {
            prediction.add(0);
          }
          print(prediction);
        },
        width: MediaQuery.sizeOf(context).width - 120.w,
        text: AppStrings.prediction);
  }
}
