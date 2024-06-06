import 'dart:convert';

import 'package:crypto/crypto.dart';

class UserToken {
  /// 生成签名
  static String getSignKey(
      {required String appId,
      required String appSecret,
      required int time,
      required String nonce}) {
    var bytes = utf8.encode("$time$appId$appSecret$nonce");
    var digest = md5.convert(bytes);

    return digest.toString();
  }

  /// 生成签名
  static String getSignSecret(
      {required String appId, required int time, required String nonce}) {
    var bytes = utf8.encode("$time$appId$nonce");
    var digest = md5.convert(bytes);

    return digest.toString();
  }
}
