import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    final removedItem = messageListItemVO.removeAt(index);
    listKey.currentState?.removeItem(
      index,
      (context, animation) {
        // 返回表示被移除项的小部件
        return _buildRemovedItem(removedItem, animation);
      },
      duration: const Duration(milliseconds: 260),
    );
  }

  Widget _buildRemovedItem(MessageListItemVO vo, Animation<double> animation) {
    // 构建在动画期间表示已移除项的小部件
    return SizeTransition(
      sizeFactor: animation,
      child: Slidable(
        key: UniqueKey(), // 确保滑动项的唯一键
        child: Container(
          height: 80.w, // 根据需要调整高度
          color: Colors.white, // 使用与您的项相同的颜色
          // 占位符内容，您可以自定义这部分内容
        ),
      ),
    );
  }
}
