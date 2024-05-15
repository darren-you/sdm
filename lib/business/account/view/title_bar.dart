import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/assert_util.dart';

class CustomSignTitleBar extends StatelessWidget {
  final String title;
  const CustomSignTitleBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = context.mediaQueryPadding.top + 83.h;

    return Container(
      padding: EdgeInsets.only(
          left: 16.w, top: context.mediaQueryPadding.top, right: 16.w),
      width: context.width,
      height: appBarHeight,
      color: Colors.white,
      child: SizedBox(
        child: Row(
          children: [
            GestureDetector(
              onTap: Get.back,
              child: SizedBox(
                child: SvgPicture.asset(AssertUtil.iconTitleBack),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
