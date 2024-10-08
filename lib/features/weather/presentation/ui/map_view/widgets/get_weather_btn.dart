import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/router/app_router.dart';
import '../../../../../../core/router/arguments.dart';
import '../../../../../../core/utils/constant/app_constants.dart';
import '../../../../../../core/utils/constant/app_strings.dart';
import '../../../../../../core/utils/dialogs/error_dialog.dart';
import '../../../../../../core/utils/enums/RequestState.dart';
import '../../../../../../core/utils/ui_components/loading_dialog.dart';
import '../../../../../../core/utils/ui_components/primary_button.dart';
import '../../../../domain/requests/location_request.dart';
import '../../../bloc/weather_bloc.dart';

class GetWeatherBtn extends StatefulWidget {
  TextEditingController destinationController;
  String userEmailAddress;
  GetWeatherBtn({super.key, required this.destinationController, required this.userEmailAddress});

  @override
  State<GetWeatherBtn> createState() => _GetWeatherBtnState();
}

class _GetWeatherBtnState extends State<GetWeatherBtn> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WeatherBloc>(),
      child: BlocConsumer<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return PrimaryButton(
              onTap: () async {
                if (widget.destinationController.text.trim() != "") {
                  List locationRequest = widget.destinationController
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
                    username: widget.userEmailAddress,
                    location:
                    widget.destinationController.text.trim(),
                    forecastDayModelList: state.stateList));
          } else if (state.weatherState ==
              RequestState.error) {
            hideLoading();
            onError(context, state.weatherMessage);
          }
        },
      ),
    );
  }
}
