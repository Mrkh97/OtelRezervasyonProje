import 'package:flutter/material.dart';
import 'package:otel_rezervasyon/controllers/RezervasyonController.dart';
import 'package:otel_rezervasyon/models/Otel.dart';
import 'package:otel_rezervasyon/models/Rezervasyon.dart';
import 'package:get/get.dart';

class RezervasyonPage extends StatelessWidget {
  RezervasyonController rc = Get.find();
  final Rezervasyon rezervasyon;
  final Otel otel;
  RezervasyonPage({required this.rezervasyon, required this.otel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      otel.adi ?? '',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Giriş Tarihi:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${rezervasyon.giris_tarihi!.year}/${rezervasyon.giris_tarihi!.month}/${rezervasyon.giris_tarihi!.day}',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Çıkış Tarihi:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${rezervasyon.cikis_tarihi!.year}/${rezervasyon.cikis_tarihi!.month}/${rezervasyon.cikis_tarihi!.day}',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Toplam:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${rezervasyon.cikis_tarihi!.difference(rezervasyon.giris_tarihi!).inDays} Gece /${rezervasyon.cikis_tarihi!.difference(rezervasyon.giris_tarihi!).inDays + 1} Gündüz',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Toplam Fiyat:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${rezervasyon.toplam_fiyat}₺',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    rc.addRezervasyon(rezervasyon);
                  },
                  child: Text(
                    'Onayla',
                    style: TextStyle(fontSize: 20, height: 3),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
