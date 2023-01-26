import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otel_rezervasyon/controllers/MainPageController.dart';
import 'package:otel_rezervasyon/views/SearchResult.dart';

class Search extends StatelessWidget {
  MainPageController mpc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mpc.getOtelSearchList({
            'search': {'il': mpc.il.value}
          });
          Get.to(() => SearchResult());
        },
        child: Icon(Icons.search),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Nerde Kalmak istiyorusunuz?'),
                  Obx(() {
                    return DropdownButton2(
                        value: mpc.il.value,
                        buttonPadding: EdgeInsets.all(2),
                        underline: Container(),
                        buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: Colors.deepPurple.shade200)),
                        items: [
                          DropdownMenuItem(
                            child: Text('Il'),
                            value: '',
                            enabled: false,
                          ),
                          DropdownMenuItem(
                            child: Text('Ankara'),
                            value: 'Ankara',
                          ),
                          DropdownMenuItem(
                            child: Text('istanbul'),
                            value: 'istanbul',
                          ),
                          DropdownMenuItem(
                            child: Text('Adana'),
                            value: 'Adana',
                          ),
                          DropdownMenuItem(
                            child: Text('İzmir'),
                            value: 'İzmir',
                          )
                        ],
                        onChanged: (value) {
                          mpc.il.value = value!;
                        });
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'hangi günler arası?',
                    style: TextStyle(height: 3),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple.shade200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'check-in',
                                style: TextStyle(fontSize: 12),
                              ),
                              Obx(() {
                                return Center(
                                  child: Text(
                                      '${mpc.checkIn.value.day}/${mpc.checkIn.value.month}/${mpc.checkIn.value.year}'),
                                );
                              }),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepPurple.shade200, width: 0.8),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'check-out',
                                style: TextStyle(fontSize: 12),
                              ),
                              Obx(() {
                                return Center(
                                  child: Text(
                                      '${mpc.checkOut.value.day}/${mpc.checkOut.value.month}/${mpc.checkOut.value.year}'),
                                );
                              }),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              var picker = await showDateRangePicker(
                                  context: context,
                                  initialDateRange: DateTimeRange(
                                      start: mpc.checkIn.value,
                                      end: mpc.checkOut.value),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2024));
                              if (picker != null) {
                                mpc.checkIn.value = picker.start;
                                mpc.checkOut.value = picker.end;
                              }
                            },
                            icon: Icon(Icons.date_range))
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
