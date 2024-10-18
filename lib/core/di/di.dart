import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:weather_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:weather_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/features/weather/data/data_source/remote_datasource.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repo.dart';
import 'package:weather_app/features/weather/domain/usecases/get_prediction_usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_usecase.dart';
import '../../core/preferences/app_pref.dart';
import '../../features/auth/data/data_source/firebase_data_source/auth_datasource.dart';
import '../../features/auth/domain/repository/firebase_repository.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/weather/presentation/bloc/weather_bloc.dart';
import '../network/dio_manager.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    // app prefs instance
    final sharedPrefs = await SharedPreferences.getInstance();

    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    // Dio manager
    sl.registerLazySingleton(() => DioManager());

    // Network Info
    sl.registerLazySingleton<NetworkInfo>(
            () => NetworkInfoImpl(InternetConnectionChecker()));

    // DataSources
    sl.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
    sl.registerLazySingleton<WeatherDataSource>(() => WeatherDataSource(sl()));

    // Repositories
    sl.registerLazySingleton<FirebaseRepository>(() => AuthRepository(sl(), sl()));
    sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(sl(), sl()));

    // UseCases
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
    sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));

    sl.registerLazySingleton<GetWeatherUseCase>(() => GetWeatherUseCase(sl()));
    sl.registerLazySingleton<GetPredictionUseCase>(() => GetPredictionUseCase(sl()));

    // Bloc
    sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));
    sl.registerFactory(() => WeatherBloc(sl(), sl()));
  }
}