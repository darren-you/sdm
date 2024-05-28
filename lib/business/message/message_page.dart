import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sdm/business/message/message_page_controller.dart';
import 'package:sdm/business/message/vo/message_list_item_vo.dart';
import 'package:sdm/components/view/custom_body.dart';
import 'package:sdm/utils/color_util.dart';

import '../../enumm/color_enum.dart';

class MessagePage extends GetView<MessagePageController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = context.mediaQueryPadding.top + 70.h;
    return Scaffold(
      backgroundColor: MyColors.background.color,
      body: CustomBody(
        backgroundColor: Colors.white,
        scroller: false,
        appBarHeight: appBarHeight,
        appBar: Container(
          width: context.width,
          height: appBarHeight,
          color: Colors.white,
          padding: EdgeInsets.only(
            left: 16.w,
            top: context.mediaQueryPadding.top + 12.h,
            right: 16.w,
            bottom: 12.h,
          ),
          child: Text(
            'MESSAGE',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF171717),
            ),
          ),
        ),
        body: SlidableAutoCloseBehavior(
          // child: ListView(
          //   children: _buildMessageList(),
          // ),
          child: AnimatedList(
            key: controller.listKey,
            initialItemCount: controller.messageListItemVO.length,
            itemBuilder: (context, index, animation) {
              return _buildMessageListItem(context, index, animation,
                  controller.messageListItemVO[index], controller);
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildMessageListItem(
    BuildContext context,
    int index,
    Animation<double> animation,
    MessageListItemVO vo,
    MessagePageController controller) {
  return SizeTransition(
    sizeFactor: animation,
    child: Slidable(
      key: ValueKey(vo.hashCode),
      groupTag: 'messageGroup',
      endActionPane: ActionPane(
        extentRatio: 0.26, // 展开的宽度
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => controller.removeItem(index),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        height: 80.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
        //color: ColorUtil.getRandomColor(),
        color: Colors.white,
        child: Row(
          children: [
            // 头像
            ClipOval(
              child: Container(
                width: 60.w,
                height: 60.w,
                color: ColorUtil.getRandomColor(),
                child: ExtendedImage.asset(
                  vo.img,
                  width: 60.w,
                  height: 60.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 昵称、最近消息
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      vo.nickName,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1E1E1E),
                      ),
                    ),
                    Container(
                      width: 9.w,
                      height: 9.w,
                      margin: EdgeInsets.only(left: 7.w),
                      decoration: BoxDecoration(
                        color: MyColors.userOnlineColor.color,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  vo.nearlyMsgContent,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF999999),
                  ),
                ),
                SizedBox(height: 6.h),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 6.h),
                Text(
                  vo.nearlyMsgTime,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFD4D6D8)),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 6.w),
                  decoration: BoxDecoration(
                    color: MyColors.mainColor.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    vo.noReadMsgCount.toString(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
