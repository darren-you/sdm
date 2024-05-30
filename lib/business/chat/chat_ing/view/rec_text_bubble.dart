import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sdm/enumm/color_enum.dart';

Widget recTextBubble(BuildContext context, String content) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: context.width * 0.7),
        child: Container(
          margin: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            color: MyColors.recMessageBubbleBg.color,
            //color: Colors.blue,
          ),
          child: GestureDetector(
            onTap: () {
              // 这里可以处理点击事件，比如展开或折叠文本
            },
            child: SelectableText.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: content,
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
              // 其他SelectableText属性...
            ),
          ),
        ),
      ),
    ],
  );
}
