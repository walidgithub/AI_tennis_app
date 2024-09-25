import 'package:flutter/material.dart';
import 'package:weather_app/core/router/arguments.dart';
import 'package:weather_app/core/utils/constant/app_strings.dart';
import 'package:weather_app/core/utils/style/app_colors.dart';
import 'package:weather_app/features/auth/domain/entities/user_model.dart';

import '../../../../../core/utils/constant/app_typography.dart';
import 'components/profile_info.dart';
import 'components/profile_pic.dart';

class ProfileView extends StatelessWidget {
  UserModelArguments userModelArguments;
  ProfileView({super.key, required this.userModelArguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColors.cPrimary,
        foregroundColor: Colors.white,
        title: Text(AppStrings.profile,style: AppTypography.kLight20),
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back))
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ProfilePic(image: userModelArguments.photoURL),
            Text(
              userModelArguments.displayName,
              style: AppTypography.kLight30,
            ),
            const Divider(height: 16.0 * 2),
            ProfileInfo(
              infoKey: AppStrings.phoneNumber,
              info: userModelArguments.phoneNumber,
            ),
            ProfileInfo(
              infoKey: AppStrings.email,
              info: userModelArguments.email,
            ),
          ],
        ),
      ),
    );
  }
}


