import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';

import '../../../../data/models/forecast_day_model.dart';

class SelectedDay extends StatelessWidget {
  List<ForecastDayModel> forecastDayModelList;
  int selectedIndex;
  String image;
  double temperature;
  String location;
  String dayName;
  SelectedDay({super.key, required this.forecastDayModelList, required this.selectedIndex, required this.temperature, required this.image, required this.location, required this.dayName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.39,
      padding:
      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppConstants.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dayName,
            style: AppTypography.kBold24
                .copyWith(color: AppColors.cWhite),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            dayName,
            style: AppTypography.kBold14
                .copyWith(color: AppColors.cWhite),
          ),
          SizedBox(
            height: 35.h,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${temperature.toString()}° C',
                      style: AppTypography.kBold36
                          .copyWith(color: AppColors.cWhite),
                    ),
                    SizedBox(
                      height: AppConstants.heightBetweenElements,
                    ),
                    Text(
                      forecastDayModelList[selectedIndex]
                          .day
                          .condition
                          .text,
                      style: AppTypography.kBold14
                          .copyWith(color: AppColors.cWhite),
                    ),
                    SizedBox(
                      height: AppConstants.heightBetweenElements,
                    ),
                    Text(
                      '${AppStrings.chanceOfRains} ${forecastDayModelList[selectedIndex].day.dailyChanceOfRain.toString()}%',
                      style: AppTypography.kBold14
                          .copyWith(color: AppColors.cWhite),
                    ),
                    SizedBox(
                      height: AppConstants.heightBetweenElements,
                    ),
                    Text(
                      '${AppStrings.humidity} ${forecastDayModelList[selectedIndex].day.avghumidity.toString()}%',
                      style: AppTypography.kBold14
                          .copyWith(color: AppColors.cWhite),
                    ),
                  ],
                ),
                Image.asset(
                  image,
                  width: 100.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
