import 'dart:developer';

import 'package:carnotautomart/data/remote/repository/carnotmart_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../data/remote/model/dropdown_data_response.dart';
import '../../data/remote/repository/carnotmart_repository.dart';
import '../widget/show_loader.dart';

class FilterController extends GetxController {
  CarnotMartRepository repository = Get.put(CarnotMartRepositoryImpl());

  final RxList<Location> dropDownLocations = <Location>[].obs;
  final RxList<Location> _dropDownBrands = <Location>[].obs;

  RxString selectName = ''.obs;
  RxString brands = 'Brand'.obs;
  @override
  void onInit() {
    super.onInit();
    getDropDownData();
  }

  @override
  void dispose() {
    super.dispose();
  
  }

  getDropDownData() async {
    try {
      final response = await repository.getDropDownResponse();
      if (response.status == true) {
        dropDownLocations.value = response.data?.locations ?? [];
      } else {}
    } catch (e) {
      if (kDebugMode) {
        log('DropDown Response Error Data: $e');
      }
    }
  }
}
