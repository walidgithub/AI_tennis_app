import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant/app_constants.dart';
import '../../../../../../core/utils/constant/app_strings.dart';
import '../../../../../../core/utils/constant/app_typography.dart';
import '../../../../../../core/utils/style/app_colors.dart';
import '../../../../data/models/forecast_day_model.dart';

class SelectedDayWeather extends StatelessWidget {
  List<ForecastDayModel> forecastDayModelList;
  int selectedIndex;
  String image;
  double temperature;
  SelectedDayWeather({super.key, required this.forecastDayModelList, required this.selectedIndex, required this.temperature, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
