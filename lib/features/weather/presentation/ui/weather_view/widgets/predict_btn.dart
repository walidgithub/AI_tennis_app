import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/imports/features_imports.dart';
import 'package:weather_app/features/weather/data/mappers/mappers.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/utils/dialogs/error_dialog.dart';
import '../../../../../../core/utils/dialogs/prediction_dialog.dart';
import '../../../../../../core/utils/enums/RequestState.dart';
import '../../../../../../core/utils/ui_components/loading_dialog.dart';
import '../../../../../../core/utils/ui_components/primary_button.dart';
import '../../../../data/models/forecast_day_model.dart';
import '../../../bloc/weather_bloc.dart';

class PredictBtn extends StatelessWidget {
  List<ForecastDayModel> forecastDayModelList;
  int selectedIndex;
  PredictBtn({super.key, required this.forecastDayModelList, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WeatherBloc>(),
      child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state.weatherState == RequestState.loading) {
              showLoading();
            } else if (state.weatherState ==
                RequestState.done) {
              hideLoading();
              onGetPrediction(context, state.predictionResult);
            } else if (state.weatherState ==
                RequestState.error) {
              hideLoading();
              onError(context, state.weatherMessage);
            }
          },
        builder: (context, state) {
          return PrimaryButton(
              onTap: () async {
                BlocProvider.of<WeatherBloc>(context).add(
                    GetPredictionEvent(forecastDayModelList[selectedIndex].getFeaturesValues()));
              },
              width: MediaQuery.sizeOf(context).width - 120.w,
              text: AppStrings.prediction);
        }
      ),
    );
  }
}

