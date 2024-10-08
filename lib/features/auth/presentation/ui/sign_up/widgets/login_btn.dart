import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';

class LoginInBtn extends StatelessWidget {
  const LoginInBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.alreadyUser,
            style: AppTypography.kLight14.copyWith(
              color: AppColors.cPrimary,
            )),
        SizedBox(
          width: AppConstants.heightBetweenElements,
        ),
        CustomTextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.signInRoute);
          },
          text: AppStrings.signIn,
        )
      ],
    );
  }
}
