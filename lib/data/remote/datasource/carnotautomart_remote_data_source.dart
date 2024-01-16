import 'package:carnotautomart/data/remote/model/account_type_response.dart';
import 'package:carnotautomart/data/remote/model/dropdown_data_response.dart';
import 'package:carnotautomart/data/remote/model/model_response.dart';

import '../model/brand_response.dart';
import '../model/car_bike_spare_parts_response.dart';
import '../model/recentry_post_response.dart';

abstract class CarnotAutoMartRemoteDataSource {
  Future<AccountTypeResponse> getAccountType();
  //Get Home page Recent post
  Future<RecentlyPostResponse> getHomePageRecentPost();
  //Get DropDown Api data
  Future<DropDownResponse> getDropDownResponse();
  //Get CarBikeSparePartsResponse
  Future<CarBikeSparePartsResponse> getAllCarBikeSpareParts(
      {required String vehicleType, required int page});
  //Get Brand
  Future<BrandResponse> getBrands({required int vehicleTypeId});
  //Get Model By Brands
  Future<ModelResponse> getModelByBrands({required int brandId});
}
