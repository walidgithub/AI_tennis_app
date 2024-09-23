import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:weather_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:weather_app/features/auth/presentation/bloc/auth_bloc.dart';
import '../../core/preferences/app_pref.dart';
import '../../features/auth/data/data_source/firebase_data_source/auth_datasource.dart';
import '../../features/auth/domain/repository/firebase_repository.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
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

    // Repositories
    sl.registerLazySingleton<FirebaseRepository>(() => AuthRepository(sl(), sl()));

    // UseCases
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));

    // Bloc
    sl.registerFactory(() => AuthBloc(sl(), sl()));
  }
}