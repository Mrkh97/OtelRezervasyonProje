import 'dart:convert';
import 'dart:ui';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animations/simple_animations.dart';

import '../controllers/AuthController.dart';

class Signup extends StatelessWidget {
  AuthController ac = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login.jpg'), fit: BoxFit.cover),
            ),
          ),
          Container(
            color: Colors.black38,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(Icons.arrow_back))
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) => ac.signupKullanici.ad = value,
                          decoration: InputDecoration(labelText: "Ad Soyad"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          onChanged: (value) =>
                              ac.signupKullanici.eposta = value,
                          decoration: InputDecoration(labelText: "E-Posta"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          onChanged: (value) =>
                              ac.signupKullanici.sifre = value,
                          obscureText: true,
                          decoration: InputDecoration(labelText: "Şifre"),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ac.signup();
                        },
                        child: Text(
                          'Üye Ol',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF381E72),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.66, 50),
                            foregroundColor: Colors.white),
                      ),
                      SizedBox(
                        height: 90,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
