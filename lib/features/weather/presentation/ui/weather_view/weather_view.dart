import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/constant/app_constants.dart';
import 'package:weather_app/core/utils/style/app_colors.dart';
import 'package:weather_app/features/weather/data/models/forecast_day_model.dart';
import 'package:weather_app/features/weather/presentation/ui/weather_view/widgets/daily_time_and_date.dart';
import 'package:weather_app/features/weather/presentation/ui/weather_view/widgets/days_weather.dart';
import 'package:weather_app/features/weather/presentation/ui/weather_view/widgets/predict_btn.dart';
import 'package:weather_app/features/weather/presentation/ui/weather_view/widgets/selected_day_weather.dart';
import 'package:weather_app/features/weather/presentation/ui/weather_view/widgets/weather_title_widget.dart';
import 'package:weather_app/features/weather/presentation/ui/weather_view/widgets/weather_logout_btn.dart';
import '../../../../../core/router/arguments.dart';
import '../../../../../core/utils/constant/app_typography.dart';
import 'functions/get_weather_background_image.dart';
import 'functions/get_weather_image.dart';

class WeatherView extends StatefulWidget {
  WeatherViewArguments arguments;
  WeatherView({super.key, required this.arguments});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {

  TimeOfDay _timeOfDay = TimeOfDay.now();
  DateTime _dateOfDay = DateTime.now();
  DateTime currentDate = DateTime.now();
  List<DateTime>? nextThreeDays = [];
  int selectedIndex = 0;
  String dayName = "";
  String image = "";
  double temperature = 0.0;
  List<ForecastDayModel> forecastDayModelList = [];
  List prediction = [];

  @override
  void initState() {
    super.initState();
    _getTimeAndDate();
    nextThreeDays = List.generate(3, (index) {
      return currentDate.add(Duration(days: index + 1));
    });
    nextThreeDays!.add(currentDate);
    nextThreeDays!.sort();
    forecastDayModelList = widget.arguments.forecastDayModelList;
    dayName = DateFormat('EEE d').format(nextThreeDays![0]);
    image = getImage(forecastDayModelList[0].day.condition.text);
    temperature = forecastDayModelList[0].day.avgtempC;
  }

  void _getTimeAndDate() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeOfDay = TimeOfDay.now();
        _dateOfDay = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(getBackground(widget
                        .arguments
                        .forecastDayModelList[selectedIndex]
                        .day
                        .condition
                        .text)),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                WeatherTitleWidget(titleTxt: widget.arguments.username),
                SizedBox(
                  height: 10.h,
                ),
                DailyTimeAndDate(timeOfDay: _timeOfDay, dateOfDay: _dateOfDay),
                SizedBox(
                  height: AppConstants.moreHeightBetweenElements,
                ),
                DaysWeather(
                    dayName: dayName,
                    forecastDayModelList: forecastDayModelList,
                    image: image,
                    nextThreeDays: nextThreeDays,
                    selectedIndex: selectedIndex,
                    temperature: temperature),
                SizedBox(
                  height: AppConstants.moreHeightBetweenElements,
                ),
                Container(
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
                        widget.arguments.location,
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
                      SelectedDayWeather(
                        selectedIndex: selectedIndex,
                        temperature: temperature,
                        image: image,
                        forecastDayModelList: forecastDayModelList,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppConstants.heightBetweenElements,
                ),
                Row(
                  children: [
                    const BackButton(),
                    SizedBox(
                      width: 10.w,
                    ),
                    PredictBtn(
                      selectedIndex: selectedIndex,
                      forecastDayModelList: forecastDayModelList,
                      prediction: prediction,
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              top: 20.h,
              right: 20.w,
              child: const WeatherLogoutBtn()
          ),
        ],
      ),
    ));
  }
}
