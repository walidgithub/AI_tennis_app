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

class MapLogoutBtn extends StatefulWidget {
  const MapLogoutBtn({Key? key}) : super(key: key);

  @override
  State<MapLogoutBtn> createState() => _MapLogoutBtnState();
}

class _MapLogoutBtnState extends State<MapLogoutBtn> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            return Container(
              height: 60.h,
              // width: 200.w,
              decoration: BoxDecoration(
                color: AppColors.cBackground,
                border: Border.all(color: AppColors.cOrange),
                borderRadius:
                BorderRadius.circular(AppConstants.radius),
              ),
              child: Center(
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<AuthBloc>(context)
                          .add(LogoutEvent());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.logout,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(AppStrings.logout,
                            style: AppTypography.kLight16
                                .copyWith(color: AppColors.cSecondary)),
                      ],
                    ),
                  )),
            );
          }, listener: (context, state) {
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
      }),
    );
  }
}
