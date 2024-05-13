import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill // 填充样式
      ..isAntiAlias = true; // 开启抗锯齿

    var path = Path();
    path.moveTo(0, 84.5.h);
    path.lineTo(0, 31.5.h);
    path.cubicTo(0, 14.38.h, 13.88.w, 0.5.h, 31.w, 0.5.h);
    path.lineTo(139.w, 0.5.h);
    path.quadraticBezierTo(149.5.w, 0.5.h, 149.5.w, 11.h);
    path.cubicTo(149.5.w, 31.99.h, 166.6.w, 49.h, 187.5.w, 49.h);
    path.cubicTo(208.4.w, 49.h, 225.5.w, 31.99.h, 225.5.w, 11.h);
    path.quadraticBezierTo(225.5.w, 0.5.h, 236.w, 0.5.h);
    path.lineTo(344.w, 0.5.h);
    path.cubicTo(361.12.w, 0.5.h, 375.w, 14.38.h, 375.w, 31.5.h);
    path.lineTo(375.w, 84.5.h);
    path.lineTo(0, 84.5.h);

    // 创建阴影用的Paint，设置阴影颜色和透明度
    final shadowPaint = Paint()
      ..color = const Color(0xFF000000).withOpacity(0.12)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8); // 设置阴影的模糊度

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
