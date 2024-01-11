import 'dart:developer';

import 'package:carnotautomart/data/remote/core/base_remote_source.dart';
import 'package:carnotautomart/data/remote/model/account_type_response.dart';
import 'package:flutter/foundation.dart';

import '../network/dio_provider.dart';
import 'carnotautomart_remote_data_source.dart';

class CarnotAutoMartRemoteDataSourceImpl extends BaseRemoteSource implements CarnotAutoMartRemoteDataSource{
  @override
  Future<AccountTypeResponse> getAccountType()async { 
   var endPoint = "${DioProvider.baseUrl}/role-list";
   var dioCall= dioClient.get(endPoint);
   try{
    var response = await callApiWithErrorParser(dioCall);
      return AccountTypeResponse.fromJson(response.data);
   }catch(e){
     if (kDebugMode) {
        log('Login Error : $e');
      }
      rethrow;
   }
  
  }
      
}