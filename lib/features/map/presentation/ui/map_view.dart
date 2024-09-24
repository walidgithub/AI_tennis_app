import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:weather_app/core/utils/constant/app_constants.dart';
import 'package:weather_app/core/utils/style/app_colors.dart';

import '../../../../core/utils/constant/app_strings.dart';
import '../../../../core/utils/constant/app_typography.dart';
import '../../../../core/utils/dialogs/back_dialog.dart';
import '../../../../core/utils/ui_components/bottom_bar.dart';
import '../../../../core/utils/ui_components/primary_button.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  TextEditingController destinationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppStrings.hello,
                                  style: AppTypography.kBold24
                                      .copyWith(color: AppColors.cSecondary)),
                              Text("walid barakat",
                                  style: AppTypography.kLight16
                                      .copyWith(color: AppColors.cSecondary)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: MediaQuery.sizeOf(context).height * 0.5,
                            child: FlutterLocationPicker(
                                initPosition: const LatLong(31.2006115, 29.9140125),
                                showSelectLocationButton: false,
                                initZoom: 11,
                                minZoomLevel: 5,
                                maxZoomLevel: 16,
                                trackMyPosition: true,
                                onError: (e) => print(e),
                                onPicked: (pickedData) {
                                  print(pickedData.latLong.latitude);
                                  print(pickedData.latLong.longitude);
                                  print(pickedData.address);
                                  print(pickedData.addressData['country']);
                                },
                                onChanged: (pickedData) {
                                  print(pickedData.latLong.latitude);
                                  print(pickedData.latLong.longitude);
                                  print(pickedData.address);
                                  print(pickedData.addressData);
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.heightBetweenElements,
                      ),
                      TextField(
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
                              border: InputBorder.none)),
                      SizedBox(
                        height: AppConstants.heightBetweenElements,
                      ),
                      PrimaryButton(
                          onTap: () async {
                            await Future.delayed(const Duration(seconds: 3));
                          },
                          text: AppStrings.search),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                    left: 10.w,
                    right: 10.w,
                    child: BottomBar(
                      logout: () {

                      },
                      profile: () {

                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
