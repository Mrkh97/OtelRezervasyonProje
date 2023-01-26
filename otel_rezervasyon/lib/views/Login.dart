import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/AuthController.dart';

class Login extends StatelessWidget {
  AuthController ac = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.jpg'), fit: BoxFit.cover),
        ),
      ),
      Container(
        height: context.height,
        color: Colors.black38,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  'En \nUygun \nFiyata \nEn İyi \nOteller login',
                  style: TextStyle(fontSize: 52, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) => ac.loginKullanici.eposta = value,
                      decoration: InputDecoration(labelText: "E-Posta"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (value) => ac.loginKullanici.sifre = value,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Şifre"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ac.login();
                    },
                    child: Text(
                      'Giriş Yap ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF381E72),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.66, 50),
                        foregroundColor: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('hesabın yoksa '),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/signup');
                          },
                          child: Text('Üye Ol')),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      )
    ]));
  }
}
