import 'dart:math';

import 'package:sdm/utils/bool_util.dart';
import 'package:sdm/utils/date_util.dart';

import '../../../utils/string_util.dart';

class MessageListItemVO {
  late String img;
  late String nickName;
  late bool onLineStatus;
  late String nearlyMsgContent;
  late String nearlyMsgTime;
  late int noReadMsgCount;

  static List<MessageListItemVO> buidTestData() {
    final messageTestData = <MessageListItemVO>[];

    for (var i = 0; i < 10; i++) {
      final item = MessageListItemVO()
        ..img = 'assets/images/photo${i + 1}.png'
        ..nickName = StringUtil.genRandomEnglishName()
        ..onLineStatus = BoolUtil.genRandomBool()
        ..nearlyMsgContent = StringUtil.genRandomChatMessage()
        ..nearlyMsgTime =
            DateUtil.getAmOrPmFromatTime(DateUtil.getRandomDateTime())
        ..noReadMsgCount = Random().nextInt(200);

      messageTestData.add(item);
    }

    return messageTestData;
  }
}
