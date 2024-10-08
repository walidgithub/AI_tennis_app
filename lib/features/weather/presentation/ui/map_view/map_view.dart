import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/constant/app_constants.dart';
import 'package:weather_app/features/weather/presentation/ui/map_view/widgets/destination_txt_field.dart';
import 'package:weather_app/features/weather/presentation/ui/map_view/widgets/get_weather_btn.dart';
import 'package:weather_app/features/weather/presentation/ui/map_view/widgets/location_picker.dart';
import 'package:weather_app/features/weather/presentation/ui/map_view/widgets/map_logout_btn.dart';
import 'package:weather_app/features/weather/presentation/ui/map_view/widgets/map_title_widget.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/preferences/app_pref.dart';
import '../../../../../core/utils/dialogs/back_dialog.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  TextEditingController destinationController = TextEditingController();
  final AppPreferences _appPreferences = sl<AppPreferences>();

  String userEmailAddress = "";

  @override
  void initState() {
    super.initState();
    getEmailAddress();
  }

  void getEmailAddress() async {
    userEmailAddress = _appPreferences.getUserEmail(userEmail)!;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
                child: Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height,
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    children: [
                      MapTitleWidget(userEmailAddress: userEmailAddress),
                      SizedBox(
                        height: 20.h,
                      ),
                      LocationPicker(destinationController: destinationController),
                      SizedBox(
                        height: AppConstants.heightBetweenElements,
                      ),
                      DestinationTxtField(destinationController: destinationController),
                      SizedBox(
                        height: AppConstants.heightBetweenElements,
                      ),
                      GetWeatherBtn(destinationController: destinationController,userEmailAddress: userEmailAddress),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 45.h,
                    left: 10.w,
                    right: 10.w,
                    child: const MapLogoutBtn())
              ],
            )),
          ),
        ),
      ),
    );
  }
}
