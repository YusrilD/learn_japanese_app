import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var homeScreenC = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (homeScreenC.listN5.isEmpty) {
            return LinearProgressIndicator();
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: homeScreenC.listN5.length,
            itemBuilder: (context, index) {
              var _data = homeScreenC.listN5[index];
              return ListTile(
                leading: Text("${_data.kanji}"),
                title: Text("${_data.kunyomi}"),
                subtitle: Text("${_data.arti}"),
                trailing: Text("${index + 1}"),
              );
            },
          );
        },
      ),
    );
  }
}
