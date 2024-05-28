import 'dart:math';

class StringUtil {
  StringUtil._();

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

  /// 生成随机英文名
  static String genRandomEnglishName() {
    if (_englishNames.isEmpty) return "No names available";
    int index = _random.nextInt(_englishNames.length);
    return _englishNames[index];
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
