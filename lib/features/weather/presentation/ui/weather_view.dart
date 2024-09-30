import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/constant/app_assets.dart';
import 'package:weather_app/core/utils/constant/app_constants.dart';
import 'package:weather_app/core/utils/style/app_colors.dart';
import 'package:weather_app/features/weather/data/models/forecast_day_model.dart';
import '../../../../core/di/di.dart';
import 'functions/get_weather_background_image.dart';
import 'functions/get_weather_image.dart';
import '../../../../core/preferences/app_pref.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/router/arguments.dart';
import '../../../../core/utils/constant/app_strings.dart';
import '../../../../core/utils/constant/app_typography.dart';
import '../../../../core/utils/dialogs/error_dialog.dart';
import '../../../../core/utils/enums/RequestState.dart';
import '../../../../core/utils/ui_components/loading_dialog.dart';
import '../../../../core/utils/ui_components/primary_button.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import 'components/days_group_view.dart';

class WeatherView extends StatefulWidget {
  WeatherViewArguments arguments;
  WeatherView({super.key, required this.arguments});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final AppPreferences _appPreferences = sl<AppPreferences>();
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
                      style: AppTypography.kBold24
                          .copyWith(color: AppColors.cTitle),
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
                            width: 15.w,
                          );
                        },
                        itemBuilder: (context, index) {
                          return DaysGroupView(
                              dayName: DateFormat('EEE d')
                                  .format(nextThreeDays![index]),
                              image: getImage(forecastDayModelList[index]
                                  .day
                                  .condition
                                  .text),
                              temperature:
                                  forecastDayModelList[index].day.avgtempC,
                              getWeather: (double selectedTemperature,
                                  String selectedImage,
                                  String selectedDayName) {
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
                ),
                SizedBox(
                  height: AppConstants.heightBetweenElements,
                ),
                PrimaryButton(
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
                    text: AppStrings.prediction),
              ],
            ),
          ),
          Positioned(
              top: 20.h,
              left: 20.w,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius:
                            BorderRadius.circular(AppConstants.radius),
                      ),
                      child: Icon(Icons.arrow_back,
                          size: 30.w, color: AppColors.cWhite)))),
          Positioned(
              top: 20.h,
              right: 20.w,
              child: BlocProvider(
                create: (context) => sl<AuthBloc>(),
                child: BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                        },
                        child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.circular(AppConstants.radius),
                            ),
                            child: Icon(Icons.logout,
                                size: 30.w, color: AppColors.cWhite)));
                  },
                  listener: (context, state) {
                    if (state.authState == RequestState.loading) {
                      showLoading();
                    } else if (state.authState == RequestState.done) {
                      hideLoading();
                      _appPreferences.logout();
                      Navigator.pushReplacementNamed(
                          context, Routes.signInRoute);
                    } else if (state.authState == RequestState.error) {
                      hideLoading();
                      onError(context, state.authMessage);
                    }
                  },
                ),
              )),
        ],
      ),
    ));
  }
}
