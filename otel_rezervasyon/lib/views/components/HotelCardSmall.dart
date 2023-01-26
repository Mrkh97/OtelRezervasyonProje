import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/views/Hotel.dart';

import '../../envirements/Enviroment.dart';
import '../../models/Otel.dart';

class HotelCardSmall extends StatelessWidget {
  Otel otel;
  HotelCardSmall(this.otel);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => Hotel(otel: otel));
        },
        child: Card(
          elevation: 4.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      otel.adi ?? '',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${otel.il}'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${otel.fiyat}₺ / gece başı')
                  ],
                ),
              ),
              Container(
                  width: 90,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: Image.network(
                      '${Enviroment.api}/${otel.fotograflar![0]}',
                      fit: BoxFit.cover,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
