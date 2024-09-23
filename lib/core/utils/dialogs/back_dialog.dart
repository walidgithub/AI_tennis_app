import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/app_strings.dart';
import '../constant/app_typography.dart';

Future<bool> onBackButtonPressed(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppStrings.warning,style: AppTypography.kBold24,),
          content: Text(AppStrings.closeApp,style: AppTypography.kBold16),
          actions: [
            TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text(AppStrings.yes,style: AppTypography.kLight14)),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(AppStrings.no,style: AppTypography.kLight14)),
          ],
        );
      });
  return exitApp;
}
