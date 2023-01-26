import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:otel_rezervasyon/models/Kullanici.dart';

import 'Otel.dart';

class Rezervasyon {
  Rezervasyon(
      {this.id,
      this.giris_tarihi,
      this.cikis_tarihi,
      this.toplam_fiyat,
      this.bekleyen,
      this.date_created_at,
      this.otel,
      this.kullaniciId,
      this.otelId});

  String? id;
  DateTime? giris_tarihi;
  DateTime? cikis_tarihi;
  int? toplam_fiyat;
  bool? bekleyen;
  DateTime? date_created_at;
  Otel? otel;
  String? otelId;
  String? kullaniciId;

  factory Rezervasyon.fromJson(Map<String, dynamic> json) => Rezervasyon(
      id: json["_id"],
      giris_tarihi: DateTime.parse(json["giris_tarihi"]),
      cikis_tarihi: DateTime.parse(json["cikis_tarihi"]),
      toplam_fiyat: json["toplam_fiyat"],
      bekleyen: json["bekleyen"],
      date_created_at: DateTime.parse(json["date_created_at"]),
      otel: Otel.fromJson(json['otel']));

  Map<String, dynamic> toJson() => {
        "giris_tarihi": giris_tarihi!.toString(),
        "cikis_tarihi": cikis_tarihi!.toString(),
        "toplam_fiyat": toplam_fiyat,
        "bekleyen": bekleyen,
        "date_created_at": date_created_at!.toString(),
        "otel": otelId,
        "kullanici": kullaniciId,
      };
}
