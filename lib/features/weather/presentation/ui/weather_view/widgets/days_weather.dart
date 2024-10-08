import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';
import '../../../../data/models/forecast_day_model.dart';
import '../functions/get_weather_image.dart';
import 'days_group_view.dart';

class DaysWeather extends StatefulWidget {
  List<DateTime>? nextThreeDays;
  int selectedIndex;
  List<ForecastDayModel> forecastDayModelList;
  Function getDailyWeather;
  DaysWeather({super.key, required this.nextThreeDays, required this.selectedIndex, required this.forecastDayModelList, required this.getDailyWeather});

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
                    widget.getDailyWeather(selectedTemperature, selectedImage, selectedDayName, index);
                  });
            }),
      ),
    );
  }
}
