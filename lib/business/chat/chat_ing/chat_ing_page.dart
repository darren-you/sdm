import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sdm/business/chat/chat_ing/chat_ing_page_controller.dart';
import 'package:sdm/components/view/custom_body.dart';
import 'package:sdm/enumm/color_enum.dart';
import 'package:sdm/utils/assert_util.dart';
import 'package:sdm/utils/color_util.dart';

import '../../../components/input/custom_edit.dart';

class ChatIngPage extends GetView<ChatIngPageController> {
  const ChatIngPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        scroller: false,
        body: Stack(
          children: [
            _messagesList(context, controller),
            _chatAppBar(context, controller),
            _chatNavBar(context, controller),
          ],
        ),
      ),
    );
  }

  /// 顶部导航栏
  Widget _chatAppBar(BuildContext context, ChatIngPageController controller) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            height: context.mediaQueryPadding.top + 44.h,
            padding: EdgeInsets.only(
                top: context.mediaQueryPadding.top, left: 16, right: 16),
            color: Colors.white.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: Get.back,
                  child: SvgPicture.asset(AssertUtil.iconTitleBack,
                      width: 26.w, height: 26.w),
                ),
                Row(
                  children: [
                    // 头像
                    ClipOval(
                      child: ExtendedImage.asset(
                        controller.messageListItemVO.img,
                        width: 36.w,
                        height: 36.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      controller.messageListItemVO.nickName,
                      style: TextStyle(fontSize: 20.sp),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(AssertUtil.iconMore,
                      width: 26.w, height: 26.w),
                )
              ],
            ),
          ),
          Container(
            height: 0.5.h,
            color: MyColors.barLine.color,
          ),
        ],
      ),
    );
  }

  /// 消息列表
  Widget _messagesList(BuildContext context, ChatIngPageController controller) {
    final chatBarHeight = context.mediaQueryPadding.top + 44.5.h;
    final chatNavHeight = 83.h;
    return SizedBox.expand(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            height: 60.h,
            color: ColorUtil.getRandomColor(),
            margin: EdgeInsets.only(
                top: index == 0 ? chatBarHeight : 0,
                bottom: index == 19 ? chatNavHeight : 0),
          );
        },
      ),
    );
  }

  /// 底部输入栏
  Widget _chatNavBar(BuildContext context, ChatIngPageController controller) {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            width: context.width,
            height: 0.5.h,
            color: MyColors.barLine.color,
          ),
          Container(
            width: context.width,
            height: 82.5.h,
            color: MyColors.chatNavBg.color,
            padding: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  SvgPicture.asset(AssertUtil.iconChatNavVoice,
                      width: 24.w, height: 24.w),
                  SizedBox(width: 12.w),
                  SvgPicture.asset(AssertUtil.iconChatNavPhoto,
                      width: 24.w, height: 24.w),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Center(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          cursorRadius: const Radius.circular(0),
                          cursorColor: MyColors.mainColor.color,
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColors.textMain.color,
                          ),
                          onChanged: (value) {},
                          onEditingComplete: () {},
                          onTap: () {},
                          onTapOutside: (event) {
                            debugPrint("点击外部区域");
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: 'Compose a message…',
                            hintStyle: TextStyle(
                              color: MyColors.chatHintColor.color,
                            ),
                            contentPadding: const EdgeInsets.only(bottom: 3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 14.w),
                  SvgPicture.asset(
                    AssertUtil.iconChatNavSend,
                    width: 24.w,
                    height: 24.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
