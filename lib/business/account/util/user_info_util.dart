import 'dart:math';

class UserInfoUtil {
  UserInfoUtil._();

  static final _random = Random();
  static final _englishNames = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eva',
    'Frank',
    'Grace',
    'Henry',
    'Ivy',
    'Jack',
    'Kate',
    'Liam',
    'Mia',
    'Nathan',
    'Olivia',
    'Peter',
    'Quinn',
    'Rachel',
    'Sam',
    'Tom',
    'Uma',
    'Victoria',
    'William',
    'Xander',
    'Yara',
    'Zoe'
  ];

  /// 随机id
  static String genRandomId() {
    return DateTime.timestamp().toString();
  }

  /// 随机头像
  static String genRandomAvatar() {
    return 'https://randomuser.me/api/portraits/men/${_random.nextInt(100)}.jpg';
  }

  /// 随机英文名
  static String genRandomEnglishName() {
    if (_englishNames.isEmpty) return "No names available";
    int index = _random.nextInt(_englishNames.length);
    return _englishNames[index];
  }

  /// 随机邮箱
  static String genRandomEmail() {
    String name = genRandomEnglishName();
    String domain = "example.com";
    return "$name@$domain";
  }

  /// 随机性别
  static String genRandomSex() {
    List<String> sexList = ["man", "woman"];
    int index = _random.nextInt(sexList.length);
    return sexList[index];
  }

  /// 随机地址
  static String genRandomAddress() {
    String address = "China";
    return address;
  }

  /// 生成随机一条聊天对话消息
  static String genRandomChatMessage() {
    String message = '';
    int length = _random.nextInt(10) + 1;
    for (int i = 0; i < length; i++) {
      message += _englishNames[_random.nextInt(_englishNames.length)];
    }
    return message;
  }
}
