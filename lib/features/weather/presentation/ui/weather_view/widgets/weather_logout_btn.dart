import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/preferences/app_pref.dart';
import '../../../../../../core/router/app_router.dart';
import '../../../../../../core/utils/constant/app_assets.dart';
import '../../../../../../core/utils/constant/app_constants.dart';
import '../../../../../../core/utils/constant/app_strings.dart';
import '../../../../../../core/utils/constant/app_typography.dart';
import '../../../../../../core/utils/dialogs/error_dialog.dart';
import '../../../../../../core/utils/enums/RequestState.dart';
import '../../../../../../core/utils/style/app_colors.dart';
import '../../../../../../core/utils/ui_components/loading_dialog.dart';
import '../../../../../auth/presentation/bloc/auth_bloc.dart';

class WeatherLogoutBtn extends StatefulWidget {
  const WeatherLogoutBtn({super.key});

  @override
  State<WeatherLogoutBtn> createState() => _WeatherLogoutBtnState();
}

class _WeatherLogoutBtnState extends State<WeatherLogoutBtn> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
              },
              child: Container(
                  width: 110.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius:
                    BorderRadius.circular(AppConstants.radius),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.logout,
                        width: 30.w,
                        color: AppColors.cWhite,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        AppStrings.logout,
                        style: AppTypography.kLight16
                            .copyWith(color: AppColors.cWhite),
                      ),
                    ],
                  )));
        },
        listener: (context, state) {
          if (state.authState == RequestState.loading) {
            showLoading();
          } else if (state.authState == RequestState.done) {
            hideLoading();
            _appPreferences.logout();
            Navigator.pushReplacementNamed(
                context, Routes.signInRoute);
          } else if (state.authState == RequestState.error) {
            hideLoading();
            onError(context, state.authMessage);
          }
        },
      ),
    );
  }
}
