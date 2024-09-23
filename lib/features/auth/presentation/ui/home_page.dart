import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/constant/app_constants.dart';
import 'package:weather_app/core/utils/style/app_colors.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/constant/app_assets.dart';
import '../../../../core/utils/constant/app_strings.dart';
import '../../../../core/utils/constant/app_typography.dart';
import '../../../../core/utils/dialogs/back_dialog.dart';
import '../../../../core/utils/ui_components/custom_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  painter: HeaderCurvedContainer(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Positioned(
                  top: 80.h,
                  child: Text(
                    AppStrings.appName,style: AppTypography.kMedium14.copyWith(
                    color: AppColors.cWhite,
                    fontSize: 30.sp,),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.cBackground,
                        image: DecorationImage(
                          image: AssetImage(AppAssets.splash),
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.60,
                    child: FadeAnimation(
                      delay: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10.w),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context)
                                    .pushReplacementNamed(Routes.signInRoute);
                              },
                              child: Container(
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: AppColors.cOrange,
                                  border: Border.all(color: AppColors.cOrange),
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.radius),
                                ),
                                child: Center(child: Text(AppStrings.signIn,style: AppTypography.kMedium14.copyWith(
                                  color: AppColors.cWhite,
                                  fontSize: 20.sp,))),
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context)
                                    .pushNamed(Routes.singUpRoute);
                              },
                              child: Container(
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: AppColors.cBackground,
                                  border: Border.all(color: AppColors.cOrange),
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.radius),
                                ),
                                child: Center(child: Text(AppStrings.signUp,style: AppTypography.kMedium14.copyWith(
                                  color: AppColors.cSecondary,
                                  fontSize: 20.sp,))),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.cOrange;
    Path path = Path()
      ..relativeLineTo(0, 250)
      ..quadraticBezierTo(size.width / 2, 400.0, size.width, 250)
      ..relativeLineTo(0, -250)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
