
import '../../../../../core/utils/constant/app_assets.dart';

String getImage(String weatherText) {
  if (weatherText.contains("sun") || weatherText.contains("Sun")) {
    return AppAssets.sunnyDay;
  } else if (weatherText.contains("rain") || weatherText.contains("Rain")) {
    return AppAssets.rainyDay;
  } else if (weatherText.contains("cloud") || weatherText.contains("Cloud")) {
    return AppAssets.cloudyDay;
  } else if (weatherText.contains("fog") || weatherText.contains("Fog")) {
    return AppAssets.foggyDay;
  } else {
    return AppAssets.clearDay;
  }
}
