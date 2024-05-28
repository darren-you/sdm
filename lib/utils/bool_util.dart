class BoolUtil {
  BoolUtil._();

  /// 生成随机bool值
  static bool genRandomBool() {
    return (DateTime.now().millisecondsSinceEpoch % 2) == 0;
  }
}
