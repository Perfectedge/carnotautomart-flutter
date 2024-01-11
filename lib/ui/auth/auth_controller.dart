import 'dart:developer';

import 'package:carnotautomart/data/remote/model/account_type_response.dart';
import 'package:carnotautomart/data/remote/repository/carnotmart_repository.dart';
import 'package:carnotautomart/data/remote/repository/carnotmart_repository_impl.dart';
import 'package:carnotautomart/ui/widget/show_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final CarnotMartRepository _repository = Get.put(CarnotMartRepositoryImpl());
  List<AccountType> accountType = [];
  getAccountType(Function(bool isSuccess) onSuccess) async {
    accountType.clear();
    showLoader();
    try {
      var response = await _repository.getAccountType();
      if (response.status == true) {
        accountType.addAll(response.data ?? []);
        onSuccess(true);
      } else {
        onSuccess(false);
      }
    } catch (e) {
      onSuccess(false);
      if (kDebugMode) {
        log('Get Account Type error:$e');
      }
    }
  }
}
