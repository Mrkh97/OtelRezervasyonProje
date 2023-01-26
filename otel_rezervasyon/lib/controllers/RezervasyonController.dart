import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/AuthController.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/models/Rezervasyon.dart';

class RezervasyonController extends GetxController {
  AuthController ac = Get.find();
  MainPageController mpc = Get.find();
  var checkIn = DateTime.now().obs;
  var checkOut = DateTime.now().obs;

  addRezervasyon(Rezervasyon rezervasyon) async {
    rezervasyon.kullaniciId = ac.currentKullanici.id;
    print(rezervasyon.giris_tarihi);
    var res = await ac.dio
        .post('/Rezervasyon/addRezervasyon', data: rezervasyon.toJson());
    // mpc.getOtelList(param);
    Get.offAllNamed('/mainpage');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var date = DateTime.now();
    checkIn.value = DateTime(date.year, date.month, date.day);
    checkOut.value = DateTime(date.year, date.month, date.day + 1);
  }
}
