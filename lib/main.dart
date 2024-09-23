import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/di.dart';
import 'core/preferences/app_pref.dart';
import 'core/router/app_router.dart';
import 'core/utils/constant/app_strings.dart';
import 'core/utils/style/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await ServiceLocator().init();
  await ScreenUtil.ensureScreenSize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());

  // ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
  //   body: SafeArea(
  //     child: Scaffold(
  //       body: Center(
  //         child: Column(
  //           children: [
  //             const Text(
  //               AppStrings.someThingWentWrong,
  //               style: TextStyle(color: AppColors.cPrimary),
  //             ),
  //             SizedBox(
  //               height: AppConstants.heightBetweenElements,
  //             ),
  //             Text(
  //               details.exceptionAsString(),
  //               style: const TextStyle(color: AppColors.cPrimary),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ),
  // );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  bool loggedIn = false;
  goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
      if (isUserLoggedIn)
        {loggedIn = true}
      else
        {loggedIn = false}
    });
  }

  @override
  void initState() {
    goNext();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              builder: EasyLoading.init(),
              onGenerateRoute: RouteGenerator.getRoute,
              // initialRoute: loggedIn ? Routes.homeRoute : Routes.signInRoute,
              initialRoute: Routes.homeRoute,
              theme: AppTheme.lightTheme);
        });
  }
}
