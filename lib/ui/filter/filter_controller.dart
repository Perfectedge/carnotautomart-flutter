import 'dart:developer';

import 'package:carnotautomart/data/remote/repository/carnotmart_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../data/remote/model/dropdown_dat_response.dart';
import '../../data/remote/repository/carnotmart_repository.dart';
import '../widget/show_loader.dart';

class FilterController extends GetxController {
  CarnotMartRepository repository = Get.put(CarnotMartRepositoryImpl());

  final RxList<Location> _dropDownLocations = <Location>[].obs;
  RxList<Location> get dropDownLocations => _dropDownLocations;
  RxString selectName = 'Select State'.obs;
  @override
  void onInit() {
    super.onInit();
    getDropDownData();
  }

  getDropDownData() async {
    try {
      final response = await repository.getDropDownResponse();
      if (response.status == true) {
        _dropDownLocations.value = response.data?.locations ?? [];
      } else {}
    } catch (e) {
      if (kDebugMode) {
        log('DropDown Response Error Data: $e');
      }
    }
  }
}
