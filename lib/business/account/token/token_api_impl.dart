import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sdm/business/account/token/token_api.dart';
import 'package:sdm/business/account/token/token_api_path.dart';
import 'package:sdm/config/app_config.dart';
import 'package:sdm/enumm/storage_key_enum.dart';
import 'package:sdm/utils/storage_util.dart';

import '../../../components/view/we_chat_loading.dart';
import '../../../net/dio/network_service.dart';
import '../../../services/app_init_service.dart';
import '../sign_up/dto/user_token.dart';

class TokenApiImpl implements TokenApi {
  static const String tag = 'TokenApiImpl';

  @override
  Future<void> getToken() async {
    if (!SmartDialog.config.checkExist()) {
      SmartDialog.show(
        backDismiss: false,
        clickMaskDismiss: false,
        maskColor: Colors.transparent,
        useAnimation: false,
        builder: (BuildContext context) {
          return const CircleLoadingIndicator();
        },
      );
    }

    final userTokenResponse = await NetworkService.post(TokenApiPath.getToken);

    // 存储Token
    if (userTokenResponse.data != null) {
      final UserToken userToken = UserToken.fromJson(userTokenResponse.data);
      // 本地存储Token
      GetStorageUtil.writeData(
          StorageKeyEnum.accessToken.key, userToken.accessToken);
      GetStorageUtil.writeData(
          StorageKeyEnum.refreshToken.key, userToken.refreshToken);
      AppConfig.updateLocalToken();
      logger.d(
          '获取Token 成功! \n access_token: ${userToken.accessToken} \n expriedIn: ${userToken.expriedIn} \n refresh_token: ${userToken.refreshToken}');
      // 添加拦截器
    } else {
      logger.e('$tag: 获取token失败!');
    }

    SmartDialog.dismiss();
  }
}
