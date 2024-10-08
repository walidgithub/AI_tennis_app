import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';

class DailyTimeAndDate extends StatelessWidget {
  TimeOfDay timeOfDay;
  DateTime dateOfDay;
  DailyTimeAndDate({super.key, required this.timeOfDay, required this.dateOfDay});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
              timeOfDay.format(context).toString(),
              style: AppTypography.kBold24,
            )),
        SizedBox(
          width: AppConstants.heightBetweenElements,
        ),
        Center(
            child: Text(
              DateFormat('EEEE | d MMM').format(dateOfDay),
              style: AppTypography.kBold18
                  .copyWith(color: AppColors.cTitle),
            ))
      ],
    );
  }
}
