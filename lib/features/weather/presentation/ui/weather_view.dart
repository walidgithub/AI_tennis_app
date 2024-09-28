import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/constant/app_assets.dart';
import 'package:weather_app/core/utils/constant/app_constants.dart';
import 'package:weather_app/core/utils/style/app_colors.dart';
import '../../../../core/router/arguments.dart';
import '../../../../core/utils/constant/app_strings.dart';
import '../../../../core/utils/constant/app_typography.dart';
import '../../../../core/utils/ui_components/primary_button.dart';
import 'components/days_group_view.dart';

class WeatherView extends StatefulWidget {
  LocationArguments arguments;
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
  String temperature = "";

  List<DaysGroupModel> daysGroup = [
    DaysGroupModel(
        dayImage: AppAssets.cloudyDay,
        dayTemp: "32 c",
        weather: "cloudy",
        humidity: "50%",
    rains: '45%'),
    DaysGroupModel(
        dayImage: AppAssets.sunnyDay,
        dayTemp: "22 c",
        weather: "sunny",
        humidity: "40%",
        rains: '25%'),
    DaysGroupModel(
        dayImage: AppAssets.foggyDay,
        dayTemp: "42 c",
        weather: "foggy",
        humidity: "50%",
        rains: '15%'),
    DaysGroupModel(
        dayImage: AppAssets.rainyDay,
        dayTemp: "35 c",
        weather: "rainy",
        humidity: "70%",
        rains: '20%'),
  ];

  @override
  void initState() {
    super.initState();
    _getTimeAndDate();
    nextThreeDays = List.generate(4, (index) {
      return currentDate.add(Duration(days: index + 1));
    });
    dayName = DateFormat('EEE d').format(nextThreeDays![0]);
    image = daysGroup[0].dayImage;
    temperature = daysGroup[0].dayTemp;
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
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.cloudy), fit: BoxFit.cover)),
        child: Column(
          children: [
            Column(
              children: [
                Center(
                    child: Text(
                  _timeOfDay.format(context).toString(),
                  style: AppTypography.kBold36,
                )),
                SizedBox(
                  height: AppConstants.heightBetweenElements,
                ),
                Center(
                    child: Text(
                  DateFormat('EEEE | d MMM').format(_dateOfDay),
                  style:
                      AppTypography.kBold24.copyWith(color: AppColors.cTitle),
                ))
              ],
            ),
            SizedBox(
              height: AppConstants.moreHeightBetweenElements,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(AppConstants.radius),
              ),
              child: Center(
                child: ListView.separated(
                    itemCount: nextThreeDays!.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 25.w,
                      );
                    },
                    itemBuilder: (context, index) {
                      return DaysGroupView(
                          dayName:
                              DateFormat('EEE d').format(nextThreeDays![index]),
                          image: daysGroup[index].dayImage,
                          temperature: daysGroup[index].dayTemp,
                      getWeather: (String selectedTemperature, String selectedImage, String selectedDayName) {
                            setState(() {
                              dayName = selectedDayName;
                              image = selectedImage;
                              temperature = selectedTemperature;
                              selectedIndex = index;
                            });
                      });
                    }),
              ),
            ),
            SizedBox(
              height: AppConstants.moreHeightBetweenElements,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.4,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(AppConstants.radius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.arguments.location,
                    style:
                        AppTypography.kBold24.copyWith(color: AppColors.cWhite),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    dayName,
                    style:
                    AppTypography.kBold14.copyWith(color: AppColors.cWhite),
                  ),
                  SizedBox(
                    height: 40.h,
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
                              temperature,
                              style: AppTypography.kBold36
                                  .copyWith(color: AppColors.cWhite),
                            ),
                            SizedBox(
                              height: AppConstants.heightBetweenElements,
                            ),
                            Text(
                              daysGroup[selectedIndex].weather,
                              style: AppTypography.kBold14
                                  .copyWith(color: AppColors.cWhite),
                            ),
                            SizedBox(
                              height: AppConstants.heightBetweenElements,
                            ),
                            Text(
                              '${AppStrings.chanceOfRains} ${daysGroup[selectedIndex].rains}',
                              style: AppTypography.kBold14
                                  .copyWith(color: AppColors.cWhite),
                            ),
                            SizedBox(
                              height: AppConstants.heightBetweenElements,
                            ),
                            Text(
                              '${AppStrings.humidity} ${daysGroup[selectedIndex].humidity}',
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
            ),
            SizedBox(
              height: AppConstants.heightBetweenElements,
            ),
            PrimaryButton(
                onTap: () async {

                },
                text: AppStrings.prediction),
          ],
        ),
      ),
    ));
  }
}

class DaysGroupModel {
  String dayImage;
  String dayTemp;
  String weather;
  String humidity;
  String rains;
  DaysGroupModel(
      {required this.dayImage,
      required this.dayTemp,
      required this.weather,
      required this.humidity,
      required this.rains});
}
