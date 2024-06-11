// To parse this JSON data, do
//
//     final userToken = userTokenFromJson(jsonString);

import 'dart:convert';

UserToken userTokenFromJson(String str) => UserToken.fromJson(json.decode(str));

String userTokenToJson(UserToken data) => json.encode(data.toJson());

class UserToken {
  String accessToken;
  String expriedIn;
  String refreshToken;

  UserToken({
    required this.accessToken,
    required this.expriedIn,
    required this.refreshToken,
  });

  factory UserToken.fromJson(Map<String, dynamic> json) => UserToken(
        accessToken: json["access_token"],
        expriedIn: json["expried_in"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "expried_in": expriedIn,
        "refresh_token": refreshToken,
      };
}
