import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese_app/view/home/home_screen.dart';

import 'controller/api_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final apiC = Get.put(ApiController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kanji Dojo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
