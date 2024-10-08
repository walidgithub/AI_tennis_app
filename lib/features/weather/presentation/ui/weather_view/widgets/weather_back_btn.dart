import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';

class WeatherBackBtn extends StatelessWidget {
  const WeatherBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius:
              BorderRadius.circular(AppConstants.radius),
            ),
            child: Icon(Icons.arrow_back,
                size: 30.w, color: AppColors.cWhite)));
  }
}
