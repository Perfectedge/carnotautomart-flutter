import 'dart:developer';

import 'package:carnotautomart/ui/widget/show_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../data/remote/model/car_bike_spare_parts_response.dart';
import '../../data/remote/repository/carnotmart_repository_impl.dart';

class RecentPostController extends GetxController {
  final _repository = Get.put(CarnotMartRepositoryImpl());
  RxList<RecentBikeCarSpareParts> carsBikeSpareParts =
      <RecentBikeCarSpareParts>[].obs;

  @override
  void dispose() {
    super.dispose();
    carsBikeSpareParts.clear();
  }

  getRecentPostData({required String vehicleType, required int page}) async {
    showLoader();
    try {
      final response = await _repository.getAllCarBikeSpareParts(
          vehicleType: vehicleType, page: page);
      if (response.status == true) {
        Get.back();
        carsBikeSpareParts.addAll(response.carsBikeSpareParts ?? []);
      } else {
        Get.back();
      }
    } catch (e) {
      if (kDebugMode) {
        log('Recent Data Error: $e');
      }
    }
  }
}
