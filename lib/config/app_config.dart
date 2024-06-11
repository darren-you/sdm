import 'dart:convert';
import 'package:crypto/crypto.dart';

class AppConfig {
  AppConfig._();

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
}
