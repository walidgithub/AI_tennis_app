
import '../../../../../../core/utils/constant/app_assets.dart';
String getBackground(String weatherText) {
  if (weatherText.contains("sun") || weatherText.contains("Sun")) {
    return AppAssets.sunny;
  } else if (weatherText.contains("rain") || weatherText.contains("Rain")) {
    return AppAssets.rainy;
  } else if (weatherText.contains("cloud") || weatherText.contains("Cloud")) {
    return AppAssets.cloudy;
  } else if (weatherText.contains("fog") || weatherText.contains("Fog")) {
    return AppAssets.foggy;
  } else {
    return AppAssets.cleary;
  }
}