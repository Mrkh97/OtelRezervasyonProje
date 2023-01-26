import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/views/components/HotelCard.dart';
import 'package:otel_rezervasyon/views/components/HotelCardMedium.dart';
import 'package:otel_rezervasyon/views/components/HotelCardSmall.dart';
import 'package:otel_rezervasyon/views/components/HotelCardSmallSearch.dart';

class SearchResult extends StatelessWidget {
  MainPageController mpc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sonuçlar'),
        elevation: 2,
      ),
      body: SafeArea(child: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: mpc.searchResults
                .map((otel) => HotelCardSmallSearch(otel))
                .toList(),
          ),
        );
      })),
    );
  }
}
