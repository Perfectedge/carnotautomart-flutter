import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoader()  {
  Get.dialog(
    barrierColor: Colors.black.withOpacity(0.2), //colorD9D9D9.withOpacity(0.075),
    WillPopScope(
      onWillPop: () async => false,
      child: Center(
          child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: const FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2.0,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Material(
                color: Colors.transparent,
                child: Text("Loading...",
                    style: TextStyle(color: Colors.white, fontSize: 12.0)),
              )
            ],
          ),
        ),
      )),
    ),
    barrierDismissible: false,
  );
}