import 'package:sdm/business/account/api/register_account_api.dart';
import 'package:sdm/business/account/sign_up/dto/user_token.dart';
import 'package:sdm/net/api/sdm_api.dart';
import 'package:sdm/net/dio/network_service.dart';
import 'package:sdm/services/app_init_service.dart';

import '../../../net/dio/api_response.dart';

class RegisterAccountService implements RegisterAccountApi {
  @override
  Future<String?> getToken() async {
    final response = await NetworkService.post<UserToken>(SdmApi.getToken);

    logger.e('token: ${response.data}');

    return response.message;
  }

  @override
  Future<ApiResponse<T>> registerAccount<T>() {
    throw UnimplementedError();
  }
}
