import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../enumm/color_enum.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.color,
      body: Container(
        width: context.width,
        height: context.height,
        color: Colors.green,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 200),
              CustomPaint(
                size: const Size(200, 200),
                painter: MyPainter(),
                foregroundPainter: MyPainter(),
                child: const Center(
                  child: Text("Blade Runner"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  ///实际的绘画发生在这里
  @override
  void paint(Canvas canvas, Size size) {
    ///创建画笔
    var paint = Paint();

    ///设置画笔的颜色
    paint.color = Colors.blue;

    ///创建路径
    var path = Path();

    ///A点 设置初始绘制点
    path.moveTo(0, 55);

    /// 绘制到 B点（100，0）
    path.cubicTo(0, 25, 48, 0, 100, 0);

    /// 绘制到 C点（214, 55）
    path.cubicTo(166, 0, 214, 25, 214, 55);

    ///绘制 Path
    canvas.drawPath(path, paint);
  }

  ///你的绘画依赖于一个变量并且该变量发生了变化，那么你在这里返回true，
  ///这样Flutter就知道它必须调用paint方法来重绘你的绘画。否则，在此处返回false表示您不需要重绘
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
