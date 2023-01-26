import 'package:flutter/material.dart';
import 'package:otel_rezervasyon/models/Rezervasyon.dart';

import '../../envirements/Enviroment.dart';

class RezervasyonCard extends StatelessWidget {
  Rezervasyon rezervasyon;
  RezervasyonCard(this.rezervasyon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
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
                    rezervasyon.otel!.adi ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'check-in : ${rezervasyon.giris_tarihi!.year}/${rezervasyon.giris_tarihi!.month}/${rezervasyon.giris_tarihi!.day}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'check-out : ${rezervasyon.cikis_tarihi!.year}/${rezervasyon.cikis_tarihi!.month}/${rezervasyon.cikis_tarihi!.day}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade500,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      '${rezervasyon.toplam_fiyat}₺',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Container(
                width: 120,
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.network(
                    '${Enviroment.api}/${rezervasyon.otel!.fotograflar![0]}',
                    fit: BoxFit.cover,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
