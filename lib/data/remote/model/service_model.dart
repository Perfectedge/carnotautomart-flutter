
import 'package:flutter/material.dart';

class ServiceModel {
  String? name;
  String? imagePath;
  VoidCallback? onTap;
  ServiceModel(this.name, this.imagePath, this.onTap);
}