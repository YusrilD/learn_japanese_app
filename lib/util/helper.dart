import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese_app/util/image.dart';


class Helper {
  static normalSnackbar(
    BuildContext context, {
    String str = "",
    isErrorSB = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            isErrorSB
                ? Icon(
                    Icons.close,
                    color: Colors.red,
                  )
                : Image.asset(
                    ImgSrc.appIcon,
                    scale: 3,
                  ),
            Text(str).paddingOnly(top: 8),
          ],
        ),
      ),
    );
  }
}
