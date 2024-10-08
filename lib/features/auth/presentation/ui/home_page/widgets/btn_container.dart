import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/router/app_router.dart';
import '../../../../../../core/utils/constant/app_strings.dart';
import '../../../../../../core/utils/style/app_colors.dart';
import '../../../../../../core/utils/ui_components/custom_animation.dart';
import 'home_btn.dart';

class BtnContainer extends StatelessWidget {
  const BtnContainer({super.key});

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
