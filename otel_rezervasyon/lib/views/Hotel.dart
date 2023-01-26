import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/controllers/RezervasyonController.dart';
import 'package:otel_rezervasyon/models/Otel.dart';
import 'package:otel_rezervasyon/models/Rezervasyon.dart';
import 'package:otel_rezervasyon/views/RezervasyonPage.dart';

import '../envirements/Enviroment.dart';

class Hotel extends StatelessWidget {
  RezervasyonController rc = Get.put(RezervasyonController());
  final Otel otel;
  Rezervasyon rezervasyon = Rezervasyon();
  Hotel({required this.otel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          otel.adi!,
          style: TextStyle(fontSize: 24),
        ),
        elevation: 5,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  height: 250.0,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                ),
                items: otel.fotograflar!.map((img) {
                  // return Image.network(
                  //   '${Enviroment.api}/${img}',
                  //   fit: BoxFit.cover,
                  // );
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                        scale: 0.5,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.8,
                        '${Enviroment.api}/${img}'),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        otel.wifi! ? Icons.wifi : Icons.wifi_off,
                        color: Colors.deepPurple,
                        size: 30,
                      ),
                      Text('Wifi')
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        otel.parkYeri!
                            ? 'assets/parking.svg'
                            : 'assets/no-parking.svg',
                        color: Colors.deepPurple,
                        height: 30,
                      ),
                      Text('Park Yeri')
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        otel.kahvalti!
                            ? 'assets/breakfast.svg'
                            : 'assets/no-breakfast.svg',
                        color: Colors.deepPurple,
                        height: 30,
                      ),
                      Text('Kahvaltı')
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        otel.fiyat.toString(),
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      Text('Gece Başı Fiyat')
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                otel.aciklama ?? '',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SelectableText(otel.adres ?? ''),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'check-in',
                            style: TextStyle(fontSize: 12),
                          ),
                          Obx(() {
                            return Center(
                              child: Text(
                                  '${rc.checkIn.value.day}/${rc.checkIn.value.month}/${rc.checkIn.value.year}'),
                            );
                          }),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepPurple.shade200, width: 0.8),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'check-out',
                            style: TextStyle(fontSize: 12),
                          ),
                          Obx(() {
                            return Center(
                              child: Text(
                                  '${rc.checkOut.value.day}/${rc.checkOut.value.month}/${rc.checkOut.value.year}'),
                            );
                          }),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          var picker = await showDateRangePicker(
                              context: context,
                              initialDateRange: DateTimeRange(
                                  start: rc.checkIn.value,
                                  end: rc.checkOut.value),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2024));
                          if (picker != null) {
                            rc.checkIn.value = picker.start;
                            rc.checkOut.value = picker.end;
                          }
                        },
                        icon: Icon(Icons.date_range))
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      rezervasyon.date_created_at = DateTime.now();
                      rezervasyon.giris_tarihi = rc.checkIn.value;

                      rezervasyon.cikis_tarihi = rc.checkOut.value;
                      rezervasyon.toplam_fiyat = rc.checkOut.value
                              .difference(rc.checkIn.value)
                              .inDays *
                          otel.fiyat!;

                      rezervasyon.bekleyen = true;
                      rezervasyon.otelId = otel.id!;
                      Get.to(() => RezervasyonPage(
                          rezervasyon: rezervasyon, otel: otel));
                    },
                    child: Text(
                      'Rezervasyon Yap',
                      style: TextStyle(fontSize: 18, height: 3),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
