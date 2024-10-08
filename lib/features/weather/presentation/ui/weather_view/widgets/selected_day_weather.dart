import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant/app_constants.dart';
import '../../../../../../core/utils/constant/app_strings.dart';
import '../../../../../../core/utils/constant/app_typography.dart';
import '../../../../../../core/utils/style/app_colors.dart';
import '../../../../data/models/forecast_day_model.dart';

class SelectedDayWeather extends StatefulWidget {
  List<ForecastDayModel> forecastDayModelList;
  int selectedIndex;
  String image;
  double temperature;
  SelectedDayWeather({super.key, required this.forecastDayModelList, required this.selectedIndex, required this.temperature, required this.image});

  @override
  State<SelectedDayWeather> createState() => _SelectedDayWeatherState();
}

class _SelectedDayWeatherState extends State<SelectedDayWeather> {
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
                '${widget.temperature.toString()}° C',
                style: AppTypography.kBold36
                    .copyWith(color: AppColors.cWhite),
              ),
              SizedBox(
                height: AppConstants.heightBetweenElements,
              ),
              Text(
                widget.forecastDayModelList[widget.selectedIndex]
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
                '${AppStrings.chanceOfRains} ${widget.forecastDayModelList[widget.selectedIndex].day.dailyChanceOfRain.toString()}%',
                style: AppTypography.kBold14
                    .copyWith(color: AppColors.cWhite),
              ),
              SizedBox(
                height: AppConstants.heightBetweenElements,
              ),
              Text(
                '${AppStrings.humidity} ${widget.forecastDayModelList[widget.selectedIndex].day.avghumidity.toString()}%',
                style: AppTypography.kBold14
                    .copyWith(color: AppColors.cWhite),
              ),
            ],
          ),
          Image.asset(
            widget.image,
            width: 100.h,
          ),
        ],
      ),
    );
  }
}
