import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';
import 'home_btn.dart';

class HomeBtnContainer extends StatelessWidget {
  const HomeBtnContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            HomeBtn(
                goTo: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.signInRoute);
                },
                btnTitle: AppStrings.signIn,
                btnColor: AppColors.cWhite,
                btnBGColor: AppColors.cOrange),
            SizedBox(
              height: 20.h,
            ),
            HomeBtn(
                goTo: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.signInRoute);
                },
                btnTitle: AppStrings.signUp,
                btnColor: AppColors.cSecondary,
                btnBGColor: AppColors.cBackground),
          ],
        ),
      ),
    );
  }
}
