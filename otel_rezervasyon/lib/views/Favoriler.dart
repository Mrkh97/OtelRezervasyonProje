import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/views/components/HotelCardMedium.dart';

class Favorilerim extends StatelessWidget {
  MainPageController mpc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children:
              mpc.favorilerim.map((otel) => HotelCardMedium(otel)).toList(),
        );
      }),
    );
  }
}
