import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/models/Otel.dart';

import '../../envirements/Enviroment.dart';

class HotelCardMedium extends StatelessWidget {
  MainPageController mpc = Get.find();
  Otel otel;
  HotelCardMedium(this.otel);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.network(
                      fit: BoxFit.cover,
                      '${Enviroment.api}/${otel.fotograflar![0]}')),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    otel.adi ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(otel.il ?? ''),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${otel.fiyat}₺ / gece başı',
                    style: TextStyle(fontSize: 12),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      mpc.removeFromFavori(otel.id!);
                    },
                  )
                ],
              ),
            )
          ]),
    );
  }
}
