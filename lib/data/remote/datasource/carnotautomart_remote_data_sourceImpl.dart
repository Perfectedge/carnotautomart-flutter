import 'dart:developer';

import 'package:carnotautomart/data/remote/core/base_remote_source.dart';
import 'package:carnotautomart/data/remote/model/account_type_response.dart';
import 'package:carnotautomart/data/remote/model/dropdown_data_response.dart';
import 'package:carnotautomart/data/remote/model/recentry_post_response.dart';
import 'package:flutter/foundation.dart';

import '../model/car_bike_spare_parts_response.dart';
import '../network/dio_provider.dart';
import 'carnotautomart_remote_data_source.dart';

class CarnotAutoMartRemoteDataSourceImpl extends BaseRemoteSource
    implements CarnotAutoMartRemoteDataSource {
  @override
  Future<AccountTypeResponse> getAccountType() async {
    var endPoint = "${DioProvider.baseUrl}/v1/role-list";
    var dioCall = dioClient.get(endPoint);
    try {
      var response = await callApiWithErrorParser(dioCall);
      return AccountTypeResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        log('Login Error : $e');
      }
      rethrow;
    }
  }

//Get Homepage Recent post
  @override
  Future<RecentlyPostResponse> getHomePageRecentPost() async {
    var endPoint = "${DioProvider.baseUrl}/v1/home";
    var dioCall = dioClient.get(endPoint);
    try {
      var response = await callApiWithErrorParser(dioCall);
      return RecentlyPostResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        log('Recent post car error : $e');
      }
      rethrow;
    }
  }

  @override
  Future<DropDownResponse> getDropDownResponse() async {
    var endPoint = "${DioProvider.baseUrl}/get-dropdown-data";
    var dioCall = dioClient.get(endPoint);
    try {
      var response = await callApiWithErrorParser(dioCall);
      final data = await compute(dropDownResponseFromJson, response.data);
      return data; //DropDownResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        log('DropDown Data : $e');
      }
      rethrow;
    }
  } 
   //Get CarBikeSparePartsResponse
  @override
  Future<CarBikeSparePartsResponse> getAllCarBikeSpareParts({required String vehicleType, required int page}) async {
    var endPoint = "${DioProvider.baseUrl}/v1/posts?vehicle_type=$vehicleType&page=$page";
    var dioCall = dioClient.get(endPoint);
    try {
      var response = await callApiWithErrorParser(dioCall);
     
      return CarBikeSparePartsResponse.fromJson(response.data); //DropDownResponse.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        log('Recent car bike spare parts error : $e');
      }
      rethrow;
    }
  }
}
