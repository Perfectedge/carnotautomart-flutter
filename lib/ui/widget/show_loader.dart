import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/helper/helper_functions.dart';
import '../utils/app_colors.dart';

showLoader() {
  Get.dialog(
    barrierColor: Colors.black.withOpacity(0.2), //colorD9D9D9.withOpacity(0.075),
    PopScope(canPop: false, child: loaderWidget()),
    barrierDismissible: false,
  );
}

loaderWidget() {
  Brightness systemBrigthness = MediaQuery.of(navigatorKey.currentContext!).platformBrightness;
  return Center(
      child: Container(
    height: 90,
    width: 90,
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: systemBrigthness == Brightness.dark ? Colors.black87 : colorF2F2F7,
      borderRadius: const BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 35.0,
          width: 35.0,
          child: CupertinoActivityIndicator(
            color: systemBrigthness == Brightness.dark ? colorF2F2F7 : Colors.black54,
            radius: 15,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text("LOADING", style: TextStyle(color: systemBrigthness == Brightness.dark ? Colors.white : Colors.black87, fontSize: 14.0))
      ],
    ),
  ));
}
