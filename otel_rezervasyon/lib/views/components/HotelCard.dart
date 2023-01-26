import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/AuthController.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/views/Home.dart';
import 'package:otel_rezervasyon/views/Hotel.dart';
import '../../envirements/Enviroment.dart';
import '../../models/Otel.dart';

class HotelCard extends StatelessWidget {
  MainPageController mpc = Get.find();
  AuthController ac = Get.find();
  HotelCard(this.otel);
  Otel otel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => Hotel(
                otel: otel,
              ));
        },
        child: Card(
          elevation: 4.5,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            width: 290,
            height: 410,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.network(
                      fit: BoxFit.cover,
                      '${Enviroment.api}/${otel.fotograflar![0]}'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      otel.adi!,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text('${otel.il}', style: TextStyle(fontSize: 14))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${otel.fiyat}₺ / gece başı'),
                    IconButton(
                        onPressed: () {
                          mpc.addToFavori(otel.id!);
                        },
                        icon: Icon(Icons.favorite))
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
