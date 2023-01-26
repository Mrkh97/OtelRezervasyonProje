import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otel_rezervasyon/controllers/bindings/AuthBinding.dart';
import 'package:otel_rezervasyon/views/Login.dart';
import 'package:otel_rezervasyon/views/MainPage.dart';
import 'package:otel_rezervasyon/views/Search.dart';
import 'package:otel_rezervasyon/views/Signup.dart';

import 'color_schemes.g.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    initialBinding: AuthBindings(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
    ),
    darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFE6E1E5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFD0BCFF)))),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Color(0xFFCAC4D0)))),
    themeMode: ThemeMode.dark,
    initialRoute: '/login',
    getPages: [
      GetPage(
          name: '/login', page: () => Login(), transition: Transition.fadeIn),
      GetPage(
          name: '/signup', page: () => Signup(), transition: Transition.fadeIn),
      GetPage(
          name: '/search', page: () => Search(), transition: Transition.fadeIn),
      GetPage(
          name: '/mainpage',
          page: () => MainPage(),
          transition: Transition.fadeIn),
      // GetPage(
      //   name: '/third',
      //   page: () => Third(),
      //   transition: Transition.zoom
      // ),
    ],
  ));
}
