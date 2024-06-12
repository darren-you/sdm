import 'package:get/get.dart';
import 'package:sdm/business/account/api/register_account_api.dart';

class RegisterAccountImpl implements RegisterAccountApi {
  static const String tag = 'RegisterAccountService';

  @override
  Future<Response<T>> registerAccount<T>() {
    throw UnimplementedError();
  }
}
