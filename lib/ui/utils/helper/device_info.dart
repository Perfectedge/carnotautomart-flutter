import 'dart:developer';

import 'package:flutter/material.dart';

class DeviceInfo {
  BuildContext context;
  double height = 0.0, width = 0.0;

  DeviceInfo(this.context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    // log(height.toString());
    log(width.toString());
  }
}
