import 'package:flutter/material.dart';

import '../../../../../../core/utils/constant/app_typography.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.infoKey,
    required this.info,
  });

  final String infoKey, info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            infoKey
            ,style: AppTypography.kBold16,
          ),
          Text(info,style: AppTypography.kLight14),
        ],
      ),
    );
  }
}