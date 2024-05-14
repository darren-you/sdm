import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../enumm/color_enum.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background.color,
      body: SizedBox(
        width: context.width,
        height: context.height,
        //color: Colors.blue,
        child: const Center(
          child: Text('message page'),
        ),
      ),
    );
  }
}
