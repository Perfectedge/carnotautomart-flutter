import 'dart:developer';

import 'package:carnotautomart/data/remote/model/brand_response.dart';
import 'package:carnotautomart/data/remote/model/model_response.dart';
import 'package:carnotautomart/data/remote/repository/carnotmart_repository_impl.dart';
import 'package:carnotautomart/ui/widget/show_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../data/remote/model/dropdown_data_response.dart';
import '../../data/remote/repository/carnotmart_repository.dart';

class FilterController extends GetxController {
  CarnotMartRepository repository = Get.put(CarnotMartRepositoryImpl());

  final RxList<Location> dropDownLocations = <Location>[].obs;
  final RxList<Brand> dropDownBrand = <Brand>[].obs;
  final RxList<Model> dropDownModel = <Model>[].obs;
  final RxList<Fuel> dropDownFuels = <Fuel>[].obs;
  final RxList<String> dropDownVehicleConditions = <String>[].obs;
  final RxList<CarColor> dropDownCarColors = <CarColor>[].obs;
  final RxList<String> dropDownGareBox = <String>[].obs;
  final RxList<String> manufacturingYears = <String>[].obs;
  List<AllFeature> allFeature = [];

  RxString selectLocationName = ''.obs;
  RxInt stateId = 0.obs;
  RxString brands = ''.obs;
  RxInt brandId = 0.obs;
  RxString model = ''.obs;
  RxInt modelId = 0.obs;
  RxString fuels = ''.obs;
  RxString condition = ''.obs;
  RxString carColor = ''.obs;
  RxInt colorId = 0.obs;
  RxString gearBox = ''.obs;
  RxString sortValue = 'date'.obs;
  RxString orderBy = 'ascending'.obs;
  RxInt fromYear = 0.obs;
  RxInt toYear = 0.obs;
  RxString bodyType = ''.obs;
  RxInt priceFrom = 0.obs;
  RxInt priceTo = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getDropDownData();
    getBrandDropDownData();
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
        dropDownFuels.value = response.data?.fuels ?? [];
        dropDownVehicleConditions.value =
            response.data?.vehicleConditions?.toStringList() ?? [];
        manufacturingYears.value = response.data?.manufacturingYears ?? [];
        dropDownCarColors.value = response.data?.colors ?? [];
        dropDownGareBox.value = response.data?.gearbox?.toStringList() ?? [];
        allFeature = response.data?.allFeatures ?? [];
      } else {}
    } catch (e) {
      if (kDebugMode) {
        log('DropDown Response Error Data: $e');
      }
    }
  }

  getBrandDropDownData() async {
    try {
      final response = await repository.getBrands(vehicleTypeId: 1);
      if (response.status == true) {
        dropDownBrand.value = response.data?.brands ?? [];
      } else {}
    } catch (e) {
      if (kDebugMode) {
        log('DropDown Response Error Data: $e');
      }
    }
  }

  getModelByBrand({required int brandId}) async {
    showLoader();
    try {
      final response = await repository.getModelByBrands(brandId: brandId);
      if (response.status == true) {
        dropDownModel.value = response.data?.models ?? [];
        Get.back();
      } else {
        Get.back();
      }
    } catch (e) {
      Get.back();
      if (kDebugMode) {
        log('DropDown Response Error Data: $e');
      }
    }
  }

  selectedAllSearchData(
      {required int fromYear,
      required int toYear,
      required int stateId,
      required int brandId,
      required int modelId,
      required String bodyType,
      required int priceFrom,
      required int priceTo,
      required String condition,
      required String fuelType,
      required int colorId,
      required String sortBy,
      required String orderBy}) {}
}
