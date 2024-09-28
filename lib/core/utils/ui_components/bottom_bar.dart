import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/utils/constant/app_assets.dart';
import 'package:weather_app/core/utils/constant/app_strings.dart';

import '../constant/app_constants.dart';
import '../constant/app_typography.dart';
import '../style/app_colors.dart';

class BottomBar extends StatefulWidget {
  Function logout;
  BottomBar({Key? key, required this.logout}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: MediaQuery.sizeOf(context).width * 0.9,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          color: AppColors.cBackground,
          border: Border.all(color: AppColors.cOrange),
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              widget.logout();
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.logout,
                  width: 30.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(AppStrings.logout,
                    style: AppTypography.kLight16
                        .copyWith(color: AppColors.cSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
