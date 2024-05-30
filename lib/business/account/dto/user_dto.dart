import 'package:sdm/business/account/util/user_info_util.dart';

class UserDTO {
  late String userId;
  late String userName;
  late String userAvatar;
  late String userEmail;
  late String userSex;
  late String userAddress;
  late String userStatus;

  /// 生成随机UserDTO信息
  static UserDTO buildTestData() {
    return UserDTO()
      ..userId = UserInfoUtil.genRandomId()
      ..userName = UserInfoUtil.genRandomEnglishName()
      ..userAvatar = UserInfoUtil.genRandomAvatar()
      ..userEmail = UserInfoUtil.genRandomEmail()
      ..userSex = UserInfoUtil.genRandomSex()
      ..userAddress = UserInfoUtil.genRandomAddress();
  }
}
