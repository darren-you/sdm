import '../../../net/models.dart';

abstract class RegisterAccountApi {
  /// 获取 Token
  Future<String?> getToken();

  /// 注册账号
  Future<ApiResponse<T>> registerAccount<T>();
}
