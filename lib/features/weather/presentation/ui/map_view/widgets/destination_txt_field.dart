import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constant/app_strings.dart';
import '../../../../../../core/utils/style/app_colors.dart';

class DestinationTxtField extends StatelessWidget {
  TextEditingController destinationController;
  DestinationTxtField({super.key, required this.destinationController});

  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: true,
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
        ],
        keyboardType: TextInputType.text,
        controller: destinationController,
        style: TextStyle(fontSize: 15.sp),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 15.sp),
            labelText: AppStrings.destination,
            labelStyle: TextStyle(
                fontSize: 15.sp, color: AppColors.cPrimary),
            border: InputBorder.none));
  }
}
