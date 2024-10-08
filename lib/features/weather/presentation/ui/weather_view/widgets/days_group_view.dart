import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/style/app_colors.dart';
import '../../../../../../core/utils/constant/app_typography.dart';

class DaysGroupView extends StatefulWidget {
  String dayName;
  String image;
  double temperature;
  Function getWeather;
  DaysGroupView({super.key, required this.dayName, required this.image, required this.temperature, required this.getWeather});

  @override
  State<DaysGroupView> createState() => _DaysGroupViewState();
}

class _DaysGroupViewState extends State<DaysGroupView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.getWeather(widget.temperature, widget.image, widget.dayName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: Text(
                widget.dayName,
                style: AppTypography.kBold16.copyWith(color: AppColors.cWhite)
              )),
          Image.asset(widget.image, width: 30.h,),
          Center(
              child: Text(
                '${widget.temperature.toString()}° C',
                style: AppTypography.kBold18.copyWith(color: AppColors.cWhite),
              )),
        ],
      ),
    );
  }
}
