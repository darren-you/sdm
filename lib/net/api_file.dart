import 'dart:typed_data';

import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ApiFile {
  /// 将 Uint8List 数据构建为Dio可上传的数据类型
  /// 这里的 AssetEntity 为 photo_manager 框架中选择图片后的自定义类型
  Future<dio.MultipartFile> multipartFileFromAssetEntity(
      AssetEntity entity) async {
    dio.MultipartFile mf;
    // Using the file path.
    final file = await entity.file;
    if (file == null) {
      throw StateError('Unable to obtain file of the entity ${entity.id}.');
    }
    mf = await dio.MultipartFile.fromFile(file.path);
    // Using the bytes.
    final bytes = await entity.originBytes;
    if (bytes == null) {
      throw StateError('Unable to obtain bytes of the entity ${entity.id}.');
    }
    mf = dio.MultipartFile.fromBytes(bytes);

    return mf;
  }

  /// 上传一张图片
  /// 将 Uint8List 图片数据构建为Dio可上传的数据类型
  static Future<dio.FormData> multipartFileFromUint8List(
      Uint8List imgBytesValue) async {
    dio.FormData formData = dio.FormData.fromMap(
      {
        "userAvatarImg": dio.MultipartFile.fromBytes(imgBytesValue,
            filename: "userAvatarImg.jpg",
            contentType: MediaType('image', 'jpeg')),
      },
    );

    return formData;
  }
}
