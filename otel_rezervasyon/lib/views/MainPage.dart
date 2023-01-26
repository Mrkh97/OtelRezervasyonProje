import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/views/Ayarlar.dart';
import 'package:otel_rezervasyon/views/Favoriler.dart';
import 'package:otel_rezervasyon/views/Home.dart';
import 'package:otel_rezervasyon/views/Rezervasyonlarim.dart';

class MainPage extends StatelessWidget {
  MainPageController mpc = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        List<Widget> mainPages = [
          Home(),
          Favorilerim(),
          Rezervasyonlarim(),
          Ayarlar()
        ];
        return mainPages[mpc.currentPage.value];
      }),
      bottomNavigationBar: Obx(() {
        return NavigationBar(
            selectedIndex: mpc.currentPage.value,
            onDestinationSelected: (value) {
              mpc.currentPage.value = value;
            },
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.favorite), label: 'Favorilerim'),
              NavigationDestination(
                  icon: Icon(Icons.work), label: 'Rezervasynlarm'),
              NavigationDestination(
                  icon: Icon(Icons.settings), label: 'Ayarlar'),
            ]);
      }),
    );
  }
}
