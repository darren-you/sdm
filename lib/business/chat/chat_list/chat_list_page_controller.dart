import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdm/business/chat/chat_list/vo/message_list_item_vo.dart';
import 'package:sdm/utils/routes_util.dart';

import 'chat_list_page.dart';

class MessagePageController extends GetxController {
  final List<MessageListItemVO> chatMessageList =
      MessageListItemVO.buidTestData(20);
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  /// 跳转到具体聊天界面
  void goToChatIngPage(int currentIndex) {
    Get.toNamed(RoutesPath.chatIngPage,
        arguments: chatMessageList[currentIndex]);
  }

  /// 添加项
  void addMessageItem() {
    chatMessageList.add(MessageListItemVO.buidOneTestData());
    listKey.currentState?.insertItem(chatMessageList.length - 1);
  }

  /// 删除项
  void removeMessageItem(int index) {
    final removedItem = chatMessageList.removeAt(index);
    listKey.currentState?.removeItem(
      index,
      (context, animation) {
        // 返回表示被移除项的小部件
        return buildRemovedItem(removedItem, animation);
      },
      duration: const Duration(milliseconds: 260),
    );
  }
}
