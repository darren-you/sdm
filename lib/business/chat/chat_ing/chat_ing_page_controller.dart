import 'package:get/get.dart';

import '../chat_list/vo/message_list_item_vo.dart';

class ChatIngPageController extends GetxController {
  late MessageListItemVO messageListItemVO;

  @override
  void onInit() {
    messageListItemVO = Get.arguments;

    super.onInit();
  }
}
