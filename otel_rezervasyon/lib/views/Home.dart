import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/views/components/HotelCardSmall.dart';

import '../controllers/AuthController.dart';
import 'components/HotelCard.dart';

class Home extends StatelessWidget {
  AuthController ac = Get.find();
  MainPageController mpc = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Keşfet',
                style: TextStyle(fontSize: 32),
              ),
              IconButton(
                  onPressed: () {
                    Get.toNamed('/search');
                  },
                  icon: Icon(
                    Icons.search_rounded,
                    size: 32,
                  ))
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.all(20),
            height: 80,
            child: Obx(
              () {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ChoiceChip(
                      elevation: 3,
                      label: Text('en çok beyenilenler'),
                      selected: mpc.chipsActive[0],
                      onSelected: (value) {
                        mpc.chipsActive.value = [false, false];
                        mpc.chipsActive[0] = true;
                        mpc.getOtelList({'sort': 'favori_sayisi'});
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      elevation: 3,
                      label: Text('en uygun fiyat'),
                      selected: mpc.chipsActive[1],
                      onSelected: (value) {
                        mpc.chipsActive.value = [false, false];
                        mpc.chipsActive[1] = true;
                        mpc.getOtelList({'sort': 'fiyat'});
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                );
              },
            )),
        Container(
          padding: EdgeInsets.all(10),
          height: 410,
          child: Obx(() {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: mpc.oteller.map((otel) => HotelCard(otel)).toList(),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'En Son Rezervasyon Yaptıklarınız',
            style: TextStyle(fontSize: 24),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Obx(() {
            return Column(
              children: mpc.rezervasyonlar
                  .map((rezervasyon) => HotelCardSmall(rezervasyon.otel!))
                  .toList(),
            );
          }),
        ),
      ]),
    );
  }
}
