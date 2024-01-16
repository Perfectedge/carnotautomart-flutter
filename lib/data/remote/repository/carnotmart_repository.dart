import 'package:carnotautomart/data/remote/model/recentry_post_response.dart';

import '../model/account_type_response.dart';
import '../model/brand_response.dart';
import '../model/car_bike_spare_parts_response.dart';
import '../model/dropdown_data_response.dart';
import '../model/model_response.dart';

abstract class CarnotMartRepository {
  //Get Account Type
  Future<AccountTypeResponse> getAccountType();
//Get Homepage Recent post
  Future<RecentlyPostResponse> getHomePageRecentPost();
  //Get DropDown Api data
  Future<DropDownResponse> getDropDownResponse();
  //Get CarBikeSparePartsResponse
  Future<CarBikeSparePartsResponse> getAllCarBikeSpareParts(
      {required String vehicleType, required int page});
  //Get Brands
  Future<BrandResponse> getBrands({required int vehicleTypeId});
  //Get Model By Brands
  Future<ModelResponse> getModelByBrands({required int brandId});
}
