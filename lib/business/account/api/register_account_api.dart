import 'package:get/get.dart';

abstract class RegisterAccountApi {
  /// 注册账号
  Future<Response<T>> registerAccount<T>();
}
