import 'package:flutter/material.dart';

import '../../../../../../core/router/app_router.dart';
import '../../../../../../core/utils/constant/app_constants.dart';
import '../../../../../../core/utils/constant/app_strings.dart';
import '../../../../../../core/utils/constant/app_typography.dart';
import '../../../../../../core/utils/style/app_colors.dart';
import '../../../../../../core/utils/ui_components/custom_text_button.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.newUser,
            style: AppTypography.kLight14.copyWith(
              color: AppColors.cPrimary,
            )),
        SizedBox(
          width: AppConstants.heightBetweenElements,
        ),
        CustomTextButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(Routes.singUpRoute);
          },
          text: AppStrings.signUp,
        )
      ],
    );
  }
}
