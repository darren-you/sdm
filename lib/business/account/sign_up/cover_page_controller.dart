import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdm/utils/imge_util.dart';
import 'package:sdm/components/image/update_img_page.dart';

class CoverPageController extends GetxController {
  var coverImgState = false.obs;
  Rx<Uint8List?> userAvatarImg = Rx<Uint8List?>(null);

  /// 选择图片
  Future<void> getImage(BuildContext context) async {
    final selectImg = await ImageUtil.getInstance().pickImage(context);

    if (null != selectImg) {
      Get.to(
        UpdateImgPage(
          selectMemoryImage: selectImg,
          newMemoryImage: (newMemoryImage) {
            userAvatarImg.value = newMemoryImage;
            coverImgState.value = true;
          },
        ),
      );
    }
  }
}
