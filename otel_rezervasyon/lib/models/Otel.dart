import 'dart:ffi';

class Otel {
  Otel(
      {this.id,
      this.adi,
      this.wifi,
      this.kahvalti,
      this.parkYeri,
      this.fotograflar,
      this.aciklama,
      this.adres,
      this.il,
      this.fiyat});

  String? id;
  String? adi;
  bool? wifi;
  bool? kahvalti;
  bool? parkYeri;
  List<String>? fotograflar;
  String? aciklama;
  String? adres;
  String? il;
  int? fiyat;

  factory Otel.fromJson(Map<String, dynamic> json) => Otel(
        id: json["_id"],
        adi: json["adi"],
        wifi: json["wifi"],
        kahvalti: json["kahvalti"],
        parkYeri: json["park_yeri"],
        fotograflar: json["fotograflar"] == null
            ? []
            : List<String>.from(json["fotograflar"]!.map((x) => x)),
        aciklama: json["aciklama"],
        adres: json["adres"],
        il: json["il"],
        fiyat: json["fiyat"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "adi": adi,
        "wifi": wifi,
        "kahvalti": kahvalti,
        "park_yeri": parkYeri,
        "fotograflar": fotograflar == null
            ? []
            : List<String>.from(fotograflar!.map((x) => x)),
        "aciklama": aciklama,
        "adres": adres,
        "il": il,
        "fiyat": fiyat,
      };
}
