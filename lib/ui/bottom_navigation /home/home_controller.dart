import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> name = [
    'ask-expert@3x.png',
    'buy-motorbike@3x.png',
    'car-valuations@3x.png',
    'driver-hire@3x.png',
    'hire-mechanic@3x.png',
    'import-car@3x.png',
    'insurance-claims@3x.png',
    'insurance@3x.png',
    'loan@3x.png',
    'mobile-mechanic@3x.png',
    'new-car@3x.png',
    'online-diagnostic@3x.png',
    'online-mechanic@3x.png',
    'sell-my-car@3x.png',
    'spare-parts@3x.png',
    'track-application@3x.png',
    'vans@3x.png',
    ];
  List<ServiceModel> homeServiceList = [
    ServiceModel('Buy Car',  'assets/images/new-car@3x.png', () {}),
    ServiceModel('Sell Products',  'assets/images/sell-my-car@3x.png', () {}),
    ServiceModel('Import Car',  'assets/images/import-car@3x.png', () {}),

    
    ];
}

class ServiceModel {
  String? name;
  String? imagePath;
  VoidCallback? onTap;
  ServiceModel(this.name, this.imagePath, this.onTap);
}
