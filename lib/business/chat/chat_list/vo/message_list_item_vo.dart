import 'dart:math';

import 'package:sdm/business/account/util/user_info_util.dart';
import 'package:sdm/utils/bool_util.dart';
import 'package:sdm/utils/date_util.dart';

class MessageListItemVO {
  late String img;
  late String nickName;
  late bool onLineStatus;
  late String nearlyMsgContent;
  late String nearlyMsgTime;
  late int noReadMsgCount;

  /// 随机生成测试数据
  static List<MessageListItemVO> buidTestData(int count) {
    final messageTestData = <MessageListItemVO>[];

    for (var i = 0; i < count; i++) {
      final item = MessageListItemVO()
        ..img = UserInfoUtil.genRandomAvatar()
        ..nickName = UserInfoUtil.genRandomEnglishName()
        ..onLineStatus = BoolUtil.genRandomBool()
        ..nearlyMsgContent = UserInfoUtil.genRandomChatMessage()
        ..nearlyMsgTime =
            DateUtil.getAmOrPmFromatTime(DateUtil.getRandomDateTime())
        ..noReadMsgCount = Random().nextInt(200);
      messageTestData.add(item);
    }

    return messageTestData;
  }

  /// 随机生成1条测试数据
  static MessageListItemVO buidOneTestData() {
    return MessageListItemVO()
      ..img = UserInfoUtil.genRandomAvatar()
      ..nickName = UserInfoUtil.genRandomEnglishName()
      ..onLineStatus = BoolUtil.genRandomBool()
      ..nearlyMsgContent = UserInfoUtil.genRandomChatMessage()
      ..nearlyMsgTime =
          DateUtil.getAmOrPmFromatTime(DateUtil.getRandomDateTime())
      ..noReadMsgCount = Random().nextInt(200);
  }
}
