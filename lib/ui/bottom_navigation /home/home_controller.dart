import 'dart:developer';

import 'package:carnotautomart/data/remote/model/recentry_post_response.dart';
import 'package:carnotautomart/ui/utils/helper/image_helper.dart';
import 'package:carnotautomart/ui/widget/show_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/remote/model/service_model.dart';
import '../../../data/remote/repository/carnotmart_repository.dart';
import '../../../data/remote/repository/carnotmart_repository_impl.dart';

class HomeController extends GetxController {
  final CarnotMartRepository _repository = Get.put(CarnotMartRepositoryImpl());
  List<ServiceModel> homeServiceList = [
    ServiceModel('Buy Car', AssetString.buyCar, () {}),
    ServiceModel('Sell Products', AssetString.sellProduct, () {}),
    ServiceModel('Import Car', AssetString.importCar, () {}),
  ];

  RxList<BikeCarSpareParts> carData = <BikeCarSpareParts>[].obs;
  RxList<BikeCarSpareParts> bikeData = <BikeCarSpareParts>[].obs;
  RxList<BikeCarSpareParts> sparePartsData = <BikeCarSpareParts>[].obs;

  getRecentHomePageData() async {
    showLoader();
    try {
      final response = await _repository.getHomePageRecentPost();
      if (response.status == true) {
        Get.back();
        carData.addAll(response.data?.cars ?? []);
        bikeData.addAll(response.data?.bikes ?? []);
        sparePartsData.addAll(response.data?.spareParts ?? []);
      }else{
        Get.back();
      }
    } catch (e) {
      Get.back();
      if (kDebugMode) {
        log('RecentHomePage Error Data: $e');
      }
    }
  }
}
