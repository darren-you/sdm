import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sdm/business/message/vo/message_list_item_vo.dart';

class MessagePageController extends GetxController {
  final List<MessageListItemVO> messageListItemVO =
      MessageListItemVO.buidTestData();
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

// 添加项
  // void addItem() {
  //   final length = messageWidgetList.length;
  //   messageWidgetList.insert(length, 'New Item $length');
  //   listKey.currentState.insertItem(length);
  // }

  // 删除项
  void removeItem(int index) {
    messageListItemVO.removeAt(index);
    listKey.currentState?.removeItem(
      index,
      (context, animation) {
        return const SizedBox();
      },
    );
  }
}
