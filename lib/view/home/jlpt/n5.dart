import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese_app/controller/N5_controller.dart';

class N5Screen extends StatelessWidget {
  N5Screen({Key? key}) : super(key: key);

  var ctrl = Get.put(N5Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade200,
        body: Obx(() {
          if (ctrl.listN5.isEmpty) {
            return Center(
              child: LinearProgressIndicator(),
            );
          }
          return PageView.builder(
            itemCount: ctrl.listN5.length,
            itemBuilder: (context, index) {
              var choices = ctrl.generateRandomList(index);
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ctrl.listN5[index].kanji!,
                      style: const TextStyle(
                        fontSize: 100,
                      ),
                    ),
                    Wrap(
                      children: [
                        for (var i = 0; i < choices.length; i++)
                          Card(
                            child: Text("${ctrl.listN5[choices[i]].kunyomi}")
                                .paddingAll(8),
                          ).paddingAll(8),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
