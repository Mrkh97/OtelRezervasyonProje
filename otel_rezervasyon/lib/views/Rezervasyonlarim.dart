import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/views/components/RezervasyonCard.dart';
import 'package:get/get.dart';

class Rezervasyonlarim extends StatelessWidget {
  MainPageController mpc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(
          children: mpc.rezervasyonlar
              .map((rezervasyon) => RezervasyonCard(rezervasyon))
              .toList());
    });
  }
}
