import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chat_list/vo/message_list_item_vo.dart';

class ChatIngPageController extends GetxController {
  final FocusNode focusNode = FocusNode();
  late MessageListItemVO messageListItemVO;

  @override
  void onInit() {
    messageListItemVO = Get.arguments;

    super.onInit();
  }
}
