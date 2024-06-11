import 'dart:math';

class MatchUtil {
  MatchUtil._();

  static String randomBit(int length) {
    var rng = Random();
    String bits = '';
    for (var i = 0; i < length; i++) {
      bits += rng.nextBool() ? '1' : '0';
    }
    return bits;
  }
}
