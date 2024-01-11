import 'package:carnotautomart/data/remote/model/account_type_response.dart';

abstract class CarnotAutoMartRemoteDataSource{
  
  Future<AccountTypeResponse> getAccountType();
    
}