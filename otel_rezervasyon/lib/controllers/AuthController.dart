import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:otel_rezervasyon/envirements/Enviroment.dart';
import 'package:otel_rezervasyon/models/Kullanici.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  final dio = Dio(BaseOptions(baseUrl: Enviroment.api));
  var loginPage = true.obs;

  Kullanici loginKullanici = Kullanici(eposta: '', sifre: '');
  Kullanici signupKullanici = Kullanici(eposta: '', sifre: '');
  Kullanici currentKullanici = Kullanici();

  login() async {
    if (loginKullanici.eposta == '') {
      Get.snackbar('Uyarı', 'Eposta Girilmedi');
      return;
    }
    if (!EmailValidator.validate(loginKullanici.eposta!)) {
      Get.snackbar('Hata', 'Geçerli Mail Girmediniz');
      return;
    }
    if (loginKullanici.sifre == '') {
      Get.snackbar('Uyarı', 'Şifre Girilmedi');
      return;
    }
    Get.showOverlay(
      asyncFunction: () async {
        try {
          var res =
              await dio.post('/Kullanici/login', data: loginKullanici.toJson());
          print(res);
          if (res.data['durum']) {
            storage.write('user', res.data['data']);
            currentKullanici = Kullanici.fromJson(res.data['data']);
            print(currentKullanici.toJson());
            Get.offAllNamed('/mainpage');
          } else {
            Get.snackbar('Uyarı', res.data['data']);
          }
        } catch (e) {
          print(e);
        }
      },
      loadingWidget: LoadingAnimationWidget.dotsTriangle(
          color: Colors.deepPurple.shade800, size: 70),
    );
  }

  signup() async {
    if (signupKullanici.ad == '') {
      Get.snackbar('Uyarı', 'Ad Soyad Girilmedi');
      return;
    }
    if (signupKullanici.eposta == '') {
      Get.snackbar('Uyarı', 'Eposta Girilmedi');
      return;
    }
    if (!EmailValidator.validate(signupKullanici.eposta!)) {
      Get.snackbar('Hata', 'Geçerli Mail Girmediniz');
      return;
    }
    if (signupKullanici.sifre == '') {
      Get.snackbar('Uyarı', 'Şifre Girilmedi');
      return;
    }
    Get.showOverlay(
      asyncFunction: () async {
        print(signupKullanici.toJson());
        try {
          var res = await dio.post('/Kullanici/signup',
              data: signupKullanici.toJson());
          print(res);
          if (res.data['durum']) {
            Get.offAllNamed('/login');
          } else {
            Get.snackbar('Uyarı', res.data['data']);
          }
        } catch (e) {
          print(e);
        }
      },
      loadingWidget: LoadingAnimationWidget.dotsTriangle(
          color: Colors.deepPurple.shade800, size: 70),
    );
  }

  updateName(String ad) async {
    try {
      final res = await dio.post('/Kullanici/updateName',
          data: {'kullaniciId': currentKullanici.id, 'ad': ad});
      storage.write('user', res.data['data']);
      currentKullanici = Kullanici.fromJson(res.data['data']);
    } catch (e) {}
  }

  logout() {
    Get.offAllNamed('/login');
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    if (storage.hasData('user')) {
      currentKullanici = Kullanici.fromJson(storage.read('user'));
      Get.offAllNamed('/mainpage');
    }
  }
}
