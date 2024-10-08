import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constant/app_constants.dart';
import '../../../../../../core/utils/style/app_colors.dart';

class WeatherBackBtn extends StatelessWidget {
  const WeatherBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius:
              BorderRadius.circular(AppConstants.radius),
            ),
            child: Icon(Icons.arrow_back,
                size: 30.w, color: AppColors.cWhite)));
  }
}
