import 'package:carnotautomart/data/remote/model/recentry_post_response.dart';

import '../model/account_type_response.dart';

abstract class CarnotMartRepository {
  //Get Account Type
  Future<AccountTypeResponse> getAccountType();
//Get Homepage Recent post
  Future<RecentlyPostResponse> getHomePageRecentPost();
}
