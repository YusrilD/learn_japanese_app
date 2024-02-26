import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese_app/view/home/jlpt/n5.dart';

import '../../controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var homeScreenC = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Get.to(N5Screen());
            },
            child: Card(
              child: ListTile(
                leading: Text("N${i + 1}"),
                title: Text("N${i + 1}"),
                subtitle: Text("N${i + 1}"),
                trailing: Text("N${i + 1}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
