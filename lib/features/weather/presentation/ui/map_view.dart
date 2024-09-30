import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:weather_app/core/router/arguments.dart';
import 'package:weather_app/core/utils/constant/app_constants.dart';
import 'package:weather_app/core/utils/style/app_colors.dart';
import 'package:weather_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/features/weather/domain/requests/location_request.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/preferences/app_pref.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/constant/app_assets.dart';
import '../../../../core/utils/constant/app_strings.dart';
import '../../../../core/utils/constant/app_typography.dart';
import '../../../../core/utils/dialogs/back_dialog.dart';
import '../../../../core/utils/dialogs/error_dialog.dart';
import '../../../../core/utils/enums/RequestState.dart';
import '../../../../core/utils/ui_components/loading_dialog.dart';
import '../../../../core/utils/ui_components/primary_button.dart';

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppStrings.hello,
                                  style: AppTypography.kBold24
                                      .copyWith(color: AppColors.cSecondary)),
                              Text(userEmailAddress.toString(),
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
                                initPosition:
                                    const LatLong(31.2006115, 29.9140125),
                                showSelectLocationButton: false,
                                initZoom: 11,
                                minZoomLevel: 5,
                                maxZoomLevel: 16,
                                trackMyPosition: true,
                                onError: (e) => print(e),
                                onPicked: (pickedData) {
                                  // print(pickedData.latLong.latitude);
                                  // print(pickedData.latLong.longitude);
                                  // print(pickedData.address);
                                  // print(
                                  //     pickedData.addressData['country']);
                                  destinationController.text = "";
                                  for (var n
                                      in pickedData.addressData.entries) {
                                    if (n.key == 'city' || n.key == 'country') {
                                      if (destinationController.text == '') {
                                        destinationController.text =
                                            "${n.value}";
                                      } else {
                                        destinationController.text =
                                            "${destinationController.text}, ${n.value}";
                                      }
                                    }
                                  }
                                },
                                onChanged: (pickedData) {
                                  // print(pickedData.latLong.latitude);
                                  // print(pickedData.latLong.longitude);
                                  // print(pickedData.address);
                                  // print(pickedData.addressData);
                                  destinationController.text = "";
                                  for (var n
                                      in pickedData.addressData.entries) {
                                    if (n.key == 'city' || n.key == 'country') {
                                      if (destinationController.text == '') {
                                        destinationController.text =
                                            "${n.value}";
                                      } else {
                                        destinationController.text =
                                            "${destinationController.text}, ${n.value}";
                                      }
                                    }
                                  }
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.heightBetweenElements,
                      ),
                      TextField(
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
                              border: InputBorder.none)),
                      SizedBox(
                        height: AppConstants.heightBetweenElements,
                      ),
                      BlocProvider(
                        create: (context) => sl<WeatherBloc>(),
                        child: BlocConsumer<WeatherBloc, WeatherState>(
                          builder: (context, state) {
                            return PrimaryButton(
                                onTap: () async {
                                  if (destinationController.text.trim() != "") {
                                    List locationRequest = destinationController
                                        .text
                                        .trim()
                                        .split(", ");
                                    BlocProvider.of<WeatherBloc>(context).add(
                                        GetWeatherEvent(LocationRequest(
                                            city: locationRequest[0],
                                            country: locationRequest[1])));
                                  } else {
                                    final snackBar = SnackBar(
                                      duration: Duration(
                                          milliseconds:
                                              AppConstants.durationOfSnackBar),
                                      content: const Text(
                                          AppStrings.locationNotReady),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                text: AppStrings.search);
                          },
                          listener: (context, state) {
                            if (state.weatherState == RequestState.loading) {
                              showLoading();
                            } else if (state.weatherState ==
                                RequestState.done) {
                              hideLoading();
                              Navigator.pushNamed(context, Routes.weatherRoute,
                                  arguments: WeatherViewArguments(
                                    username: userEmailAddress,
                                      location:
                                          destinationController.text.trim(),
                                      forecastDayModelList: state.stateList));
                            } else if (state.weatherState ==
                                RequestState.error) {
                              hideLoading();
                              onError(context, state.weatherMessage);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 45.h,
                    left: 10.w,
                    right: 10.w,
                    child: BlocProvider(
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
                    ))
              ],
            )),
          ),
        ),
      ),
    );
  }
}
