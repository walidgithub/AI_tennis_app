import 'package:flutter/material.dart';

import '../../../../../../core/utils/constant/app_strings.dart';
import '../../../../../../core/utils/constant/app_typography.dart';
import '../../../../../../core/utils/style/app_colors.dart';

class WeatherTitleWidget extends StatelessWidget {
  String titleTxt;
  WeatherTitleWidget({super.key, required this.titleTxt});

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
            Text(titleTxt,
                style: AppTypography.kLight16
                    .copyWith(color: AppColors.cSecondary)),
          ],
        ),
      ],
    );
  }
}
