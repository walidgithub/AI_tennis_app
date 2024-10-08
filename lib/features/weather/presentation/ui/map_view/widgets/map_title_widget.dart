import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';

class MapTitleWidget extends StatelessWidget {
  String userEmailAddress;
  MapTitleWidget({super.key, required this.userEmailAddress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.hello,
                style: AppTypography.kBold24
                    .copyWith(color: AppColors.cSecondary)),
            Text(userEmailAddress.toString(),
                style: AppTypography.kLight16
                    .copyWith(color: AppColors.cSecondary)),
          ],
        ),
      ],
    );
  }
}
