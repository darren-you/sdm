import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ImageUtil {
  static final ImageUtil _imageUtil = ImageUtil._();

  ImageUtil._();

  factory ImageUtil() {
    return _imageUtil;
  }

  static ImageUtil getInstance() {
    return _imageUtil;
  }

  /// 调用 wechat_assets_picker 库选择 1 张图片
  Future<Uint8List?> pickImage(BuildContext context) async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
        maxAssets: 1,
        pathThumbnailSize: ThumbnailSize.square(84),
        gridCount: 3,
        pageSize: 300,
        requestType: RequestType.image,
        textDelegate: AssetPickerTextDelegate(),
      ),
    );

    if (result != null) {
      return result.first.originBytes;
    }

    return null;
  }

  /// 保存一张图片，返回存储路径
  Future<String?> save(String name, Uint8List fileData) async {
    final String title = '${DateTime.now().millisecondsSinceEpoch}_$name';
    final AssetEntity? imageEntity = await PhotoManager.editor.saveImage(
      fileData,
      title: title,
    );
    final File? file = await imageEntity?.file;

    // 返回保存后的路径
    return file?.path;
  }
}
