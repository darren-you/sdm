import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/color_util.dart';

class LoopingWrapWidget extends StatefulWidget {
  @override
  _LoopingWrapWidgetState createState() => _LoopingWrapWidgetState();
}

class _LoopingWrapWidgetState extends State<LoopingWrapWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    /// 当滚动到底部时，将滚动位置设置为顶部
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _scrollController.jumpTo(0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      reverse: true, // 由下而上滚动
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          width: context.width,
          height: 220.h,
          color: ColorUtil.getRandomColor(),
          alignment: Alignment.center,
          child: Text('Item $index'),
        );
      },
    );
  }
}
