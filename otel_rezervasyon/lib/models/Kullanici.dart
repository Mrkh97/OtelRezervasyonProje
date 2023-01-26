import 'package:otel_rezervasyon/models/Otel.dart';

class Kullanici {
  Kullanici({
    this.id,
    this.ad,
    this.eposta,
    this.sifre,
    this.rezervasyonList,
    this.favoriList,
  });

  String? id;
  String? ad;
  String? eposta;
  String? sifre;
  dynamic rezervasyonList;
  dynamic favoriList;

  factory Kullanici.fromJson(Map<String, dynamic> json) => Kullanici(
        id: json["_id"],
        ad: json["ad"],
        eposta: json["eposta"],
        sifre: json["sifre"],
        rezervasyonList: json["rezervasyon_list"],
        favoriList: json["favori_list"],
      );

  Map<String, dynamic> toJson() => {
        "ad": ad ?? '',
        "eposta": eposta ?? '',
        "sifre": sifre ?? '',
      };
}
