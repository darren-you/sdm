import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:sdm/utils/storage_util.dart';

import '../enumm/storage_key_enum.dart';

class AppConfig {
  AppConfig._();

  // access_token
  static String? _accessToken;
  // refresh_token
  static String? _refreshToken;

  // platfrom
  static const platfrom = "iOS";
  // appId
  static const appID = "f1984b7ac8e487ba6a84587abfbea9c5";
  // secret
  static const secret = 'dbb83743-c6b4-8ae5-5be4-cc60e25030ca';

  /// 生成签名-有Token
  static String getSignKey(
      {required String appId,
      required String appSecret,
      required int time,
      required String nonce}) {
    var bytes = utf8.encode("$time$appId$appSecret$nonce");
    var digest = md5.convert(bytes);

    return digest.toString();
  }

  /// 生成签名-无Token
  static String getSignSecret(
      {required String appId, required int time, required String nonce}) {
    var bytes = utf8.encode("$time$appId$nonce");
    var digest = md5.convert(bytes);

    return digest.toString();
  }

  /// 获取 accessToken
  static String? getAccessToken() {
    _accessToken ??= GetStorageUtil.readData(StorageKeyEnum.accessToken.key);
    return _accessToken;
  }

  /// 获取 refreshToken
  static String? getRefreshToken() {
    _refreshToken ??= GetStorageUtil.readData(StorageKeyEnum.refreshToken.key);
    return _refreshToken;
  }

  /// 同步更新本地Token
  static void updateLocalToken() {
    _accessToken = null;
    _refreshToken = null;
    getAccessToken();
    getRefreshToken();
  }

  /// 清除Token
  static void clearToken() {
    _accessToken = null;
    _refreshToken = null;
    GetStorageUtil.removeData(StorageKeyEnum.accessToken.key);
    GetStorageUtil.removeData(StorageKeyEnum.refreshToken.key);
  }
}
