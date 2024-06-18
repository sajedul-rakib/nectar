import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/firebase_options.dart';
import 'package:nectar/routes/route.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/utils/color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const KacaBazar());
}

class KacaBazar extends StatelessWidget {
  const KacaBazar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
      navigatorKey: Get.key,
      theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              showUnselectedLabels: true,
              backgroundColor: AppColors.whiteColor,
              elevation: 1.0,
              selectedItemColor: AppColors.backgroundColor,
              unselectedItemColor: AppColors.blackColor),
          fontFamily: 'montserrat',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  textStyle: const WidgetStatePropertyAll(TextStyle(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w700,
                  )),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.backgroundColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))))),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.initial,
      getPages: RouteScreen.route,
    );
  }
}
