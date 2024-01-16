import 'package:carnotautomart/data/remote/datasource/carnotautomart_remote_data_source.dart';
import 'package:carnotautomart/data/remote/model/account_type_response.dart';
import 'package:carnotautomart/data/remote/model/dropdown_data_response.dart';
import 'package:carnotautomart/data/remote/model/recentry_post_response.dart';
import 'package:get/get.dart';

import '../datasource/carnotautomart_remote_data_sourceImpl.dart';
import '../model/car_bike_spare_parts_response.dart';
import 'carnotmart_repository.dart';

class CarnotMartRepositoryImpl implements CarnotMartRepository {
  final CarnotAutoMartRemoteDataSource _dataSource =
      Get.put(CarnotAutoMartRemoteDataSourceImpl());

  @override
  Future<AccountTypeResponse> getAccountType() {
    return _dataSource.getAccountType();
  }

  @override
  Future<RecentlyPostResponse> getHomePageRecentPost() {
    return _dataSource.getHomePageRecentPost();
  }

  @override
  Future<DropDownResponse> getDropDownResponse() {
    return _dataSource.getDropDownResponse();
  } 
  @override
  //Get CarBikeSparePartsResponse
  Future<CarBikeSparePartsResponse> getAllCarBikeSpareParts({required String vehicleType,required int page}) {
    return _dataSource.getAllCarBikeSpareParts(vehicleType: vehicleType,page: page);
  }
}
