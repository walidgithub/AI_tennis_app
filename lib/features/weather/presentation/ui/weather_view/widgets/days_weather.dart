import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/utils/constant/app_constants.dart';
import '../../../../data/models/forecast_day_model.dart';
import '../functions/get_weather_image.dart';
import 'days_group_view.dart';

class DaysWeather extends StatefulWidget {
  List<DateTime>? nextThreeDays;
  int selectedIndex;
  String dayName;
  String image;
  double temperature;
  List<ForecastDayModel> forecastDayModelList;
  DaysWeather({super.key, required this.nextThreeDays, required this.selectedIndex, required this.dayName, required this.temperature, required this.image, required this.forecastDayModelList});

  @override
  State<DaysWeather> createState() => _DaysWeatherState();
}

class _DaysWeatherState extends State<DaysWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.2,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppConstants.radius),
      ),
      child: Center(
        child: ListView.separated(
            itemCount: widget.nextThreeDays!.length,
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
                      .format(widget.nextThreeDays![index]),
                  image: getImage(widget.forecastDayModelList[index]
                      .day
                      .condition
                      .text),
                  temperature:
                  widget.forecastDayModelList[index].day.avgtempC,
                  getWeather: (double selectedTemperature,
                      String selectedImage,
                      String selectedDayName) {
                    setState(() {
                      widget.dayName = selectedDayName;
                      widget.image = selectedImage;
                      widget.temperature = selectedTemperature;
                      widget.selectedIndex = index;
                    });
                  });
            }),
      ),
    );
  }
}
