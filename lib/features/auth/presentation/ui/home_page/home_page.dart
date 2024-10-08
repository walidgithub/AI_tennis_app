import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/style/app_colors.dart';
import 'package:weather_app/features/auth/presentation/ui/home_page/widgets/btn_container.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/preferences/app_pref.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/utils/constant/app_assets.dart';
import '../../../../../core/utils/constant/app_strings.dart';
import '../../../../../core/utils/constant/app_typography.dart';
import '../../../../../core/utils/dialogs/back_dialog.dart';
import 'widgets/header_curved_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppPreferences _appPreferences = sl<AppPreferences>();
  Timer? _timer;
  bool loggedIn = false;

  _startDelay() {
    _timer = Timer(const Duration(microseconds: 100), _goNext);
  }

  _goNext() async {
    Navigator.pushReplacementNamed(context, Routes.mapRoute);
  }

  checkLogin() async {
    await _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn) {loggedIn = true} else {loggedIn = false}
        });
    if (loggedIn) {
      _startDelay();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: HeaderCurvedContainer(context: context),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Positioned(
                top: 80.h,
                child: Text(
                  AppStrings.appName,
                  style: AppTypography.kMedium14.copyWith(
                    color: AppColors.cWhite,
                    fontSize: 35.sp,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25.h,
                child: Container(
                  width: 200.w,
                  height: 200.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cBackground,
                      image: DecorationImage(
                          image: AssetImage(AppAssets.splash),
                          fit: BoxFit.contain,
                          scale: 1)),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.60.h,
                  child: const BtnContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
