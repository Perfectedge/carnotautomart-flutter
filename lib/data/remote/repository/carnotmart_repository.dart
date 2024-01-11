import '../model/account_type_response.dart';

abstract class CarnotMartRepository{
    Future<AccountTypeResponse> getAccountType();
}