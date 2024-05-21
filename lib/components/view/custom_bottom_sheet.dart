import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sdm/utils/screen_util.dart';

Future<T?> showMyBottomSheet<T>(
  BuildContext context, {
  Future<T>? init,
  required Widget showChild,
  bool scrollControlled = false,
  Color? backgroundColor = Colors.white,
  EdgeInsets? bodyPadding = const EdgeInsets.all(0),
  BorderRadius? radius = const BorderRadius.only(
      topLeft: Radius.circular(20), topRight: Radius.circular(20)),
}) async {
  // 在BottomSheet拉起时，需要根据背景使底部导航栏沉静
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
    ));
  }

  if (init != null) {
    await init.then((value) async {
      T? result = await showModalBottomSheet(
        context: context,
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: radius!),
        barrierColor: Colors.black.withOpacity(0.25),
        // A处
        constraints: BoxConstraints(
            maxHeight: MyScreenUtil.getInstance().screenHeight -
                MyScreenUtil.getInstance().statusBarHeight,
            maxWidth: context.width),
        isScrollControlled: true,
        builder: (context) => showChild,
      );
      return result;
    });
  } else {
    T? result = await showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: radius!),
      barrierColor: Colors.black.withOpacity(0.25),
      // A处
      constraints: BoxConstraints(
          maxHeight: MyScreenUtil.getInstance().screenHeight -
              MyScreenUtil.getInstance().statusBarHeight,
          maxWidth: context.width),
      isScrollControlled: true,
      builder: (context) => showChild,
    );
    return result;
  }

  // 关闭BottomSheet时恢复背景色
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
  }

  return null;
}
