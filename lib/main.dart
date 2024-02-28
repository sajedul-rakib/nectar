import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/routes/route.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/utils/color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyCNXajb8R2tByCB0GACd7_5kXIL-BnFgd4",
              appId: "1:452236619238:android:004248f0a004ad8b1e3a27",
              messagingSenderId: "452236619238",
              projectId: "ecommerce-8ea16"))
      : await Firebase.initializeApp();
  await Firebase.initializeApp();
  runApp(const KacaBazar());
}

class KacaBazar extends StatelessWidget {
  const KacaBazar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
                  textStyle: const MaterialStatePropertyAll(TextStyle(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w700,
                  )),
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColors.backgroundColor),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))))),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.INITIAL,
      getPages: RouteScreen.route,
    );
  }
}
