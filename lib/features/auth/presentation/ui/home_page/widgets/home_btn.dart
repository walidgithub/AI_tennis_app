import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';

class HomeBtn extends StatelessWidget {
  Function goTo;
  String btnTitle;
  Color btnColor;
  Color btnBGColor;
  HomeBtn({super.key, required this.goTo, required this.btnTitle, required this.btnColor, required this.btnBGColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        goTo();
      },
      child: Container(
        height: 60.h,
        width: MediaQuery.sizeOf(context).width / 1.2,
        decoration: BoxDecoration(
          color: btnBGColor,
          border: Border.all(color: AppColors.cOrange),
          borderRadius: BorderRadius.circular(
              AppConstants.radius),
        ),
        child: Center(child: Text(btnTitle,style: AppTypography.kMedium14.copyWith(
          color: btnColor,
          fontSize: 20.sp,))),
      ),
    );
  }
}
