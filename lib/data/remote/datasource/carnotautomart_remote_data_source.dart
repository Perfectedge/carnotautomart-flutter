import 'package:carnotautomart/data/remote/model/account_type_response.dart';
import 'package:carnotautomart/data/remote/model/dropdown_dat_response.dart';

import '../model/recentry_post_response.dart';

abstract class CarnotAutoMartRemoteDataSource {
  Future<AccountTypeResponse> getAccountType();
  //Get Home page Recent post
  Future<RecentlyPostResponse> getHomePageRecentPost();
  //Get DropDown Api data
  Future<DropDownResponse> getDropDownResponse();
}
