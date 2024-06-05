import 'package:sdm/business/account/api/register_account_api.dart';
import 'package:sdm/net/api/sdm_api.dart';
import 'package:sdm/net/dio/network_service.dart';
import 'package:sdm/net/models.dart';
import 'package:sdm/services/app_init_service.dart';

class RegisterAccountService implements RegisterAccountApi {
  @override
  Future<String?> getToken() async {
    final response = await NetworkService.post(SdmApi.getToken);

    logger.e('token: ${response.message}');

    return response.message;
  }

  @override
  Future<ApiResponse<T>> registerAccount<T>() {
    throw UnimplementedError();
  }
}
