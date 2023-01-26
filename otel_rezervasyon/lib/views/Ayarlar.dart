import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/AuthController.dart';

class Ayarlar extends StatelessWidget {
  AuthController ac = Get.find();
  String guncelAd = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/avatar.jpg')),
          ),
          Column(
            children: [
              Text(
                ac.currentKullanici.ad ?? '',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                ac.currentKullanici.eposta ?? '',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Container(),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Ink(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Get.dialog(Dialog(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: 300,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Ad Soyad',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  TextField(
                                    controller: TextEditingController(
                                        text: ac.currentKullanici.ad),
                                    onChanged: (value) => guncelAd = value,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        ac.updateName(guncelAd);
                                        Get.back();
                                      },
                                      child: Text(
                                        'Güncelle',
                                        style: TextStyle(fontSize: 16),
                                      ))
                                ]),
                          ),
                        ));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(8),
                        child: Row(children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Profil Güncelle',
                            style: TextStyle(fontSize: 16, height: 2),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Ink(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        ac.logout();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(8),
                        child: Row(children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Güvenli Çıkış',
                            style: TextStyle(fontSize: 16, height: 2),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
