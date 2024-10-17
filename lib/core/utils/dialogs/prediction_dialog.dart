import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/imports/features_imports.dart';

import '../../../features/weather/data/models/prediction_model.dart';
import '../constant/app_strings.dart';
import '../constant/app_typography.dart';

Future<bool> onGetPrediction(BuildContext context, PredictionModel predictionResult) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppStrings.predictionResult,style: AppTypography.kBold24,),
          content: Text(predictionResult.prediction == [0] ? AppStrings.youCanNotGo : AppStrings.youCanGo,style: AppTypography.kBold16.copyWith(color: predictionResult.prediction == [0] ? AppColors.cOrange : AppColors.cPrimary)),
          actions: [
            Center(
              child: Column(
                children: [
                  Icon(predictionResult.prediction == [0] ? Icons.error_outline : Icons.check_circle_outline,size: 60.w,color: predictionResult.prediction == [0] ? AppColors.cOrange : AppColors.cPrimary),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(AppStrings.close,style: AppTypography.kLight14))
                ],
              ),
            ),
          ],
        );
      });
  return exitApp;
}
