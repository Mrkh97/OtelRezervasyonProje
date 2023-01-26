import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/AuthController.dart';
import 'package:otel_rezervasyon/models/Otel.dart';
import 'package:otel_rezervasyon/models/Rezervasyon.dart';

import '../envirements/Enviroment.dart';

class MainPageController extends GetxController {
  AuthController ac = Get.find();
  var currentPage = 0.obs;
  var chipsActive = [true, false].obs;
  var checkIn = DateTime.now().obs;
  var checkOut = DateTime.now().obs;
  var il = ''.obs;
  final dio = Dio(BaseOptions(baseUrl: Enviroment.api));
  RxList<Otel> oteller = RxList<Otel>();
  RxList<Otel> searchResults = RxList<Otel>();
  RxList<Otel> favorilerim = RxList<Otel>();
  RxList<Rezervasyon> rezervasyonlar = RxList<Rezervasyon>();

  getOtelList(param) async {
    try {
      var res = await dio.post('/Otel/getOtelList', data: param);
      oteller.value = List.from(res.data.map((otel) => Otel.fromJson(otel)));
    } catch (e) {
      print(e);
    }
  }

  getOtelSearchList(param) async {
    try {
      var res = await dio.post('/Otel/getOtelList', data: param);
      searchResults.value =
          List.from(res.data.map((otel) => Otel.fromJson(otel)));
      print(res);
    } catch (e) {
      print(e);
    }
  }

  getFavoriList() async {
    try {
      var res = await dio.post('/Otel/getFavoriList',
          data: {'kullanici': ac.currentKullanici.id});
      favorilerim.value =
          List.from(res.data['data'].map((otel) => Otel.fromJson(otel)));
    } catch (e) {
      print(e);
    }
  }

  getRezervasyonList() async {
    try {
      var res = await dio.post('/Rezervasyon/getRezervasyonListKullanici',
          data: {'kullanici': ac.currentKullanici.id});
      rezervasyonlar.value = List.from(res.data['data']
          .map((rezervasyon) => Rezervasyon.fromJson(rezervasyon)));
    } catch (e) {
      print(e);
    }
  }

  addToFavori(String otelId) async {
    try {
      var res = await dio.post('/Otel/addFavori',
          data: {'kullanici': ac.currentKullanici.id, 'otel': otelId});
      getFavoriList();
    } catch (e) {
      print(e);
    }
  }

  removeFromFavori(String otelId) async {
    try {
      var res = await dio.post('/Otel/removeFavori',
          data: {'kullanici': ac.currentKullanici.id, 'otel': otelId});
      getFavoriList();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getOtelList({
      'sort': 'favori_sayisi',
    });
    getFavoriList();
    getRezervasyonList();
  }
}
