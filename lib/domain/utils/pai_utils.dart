import 'package:mj_calc_flutter/domain/model/pai.dart';

class PaiUtils {
  /// 種類を表す文字列と、数字を表す文字列からPaiインスタンスを返す
  /// fromString("z", "1")
  ///  => Pai(kind: PaiKind.manzu, num: 1, aka: false);
  static Pai createPai(String kindStr, String numStr) {
    final int num;
    final bool aka;
    try {
      final tmp = int.parse(numStr);
      if (tmp == 0) {
        num = 5;
        aka = true;
      } else {
        num = tmp;
        aka = false;
      }
    } on FormatException catch (e) {
      throw ArgumentError('Invalid num: $numStr, e: $e');
    }

    final PaiKind kind = _convertStringToPaiKind(kindStr);
    return Pai(kind: kind, num: num, aka: aka);
  }

  /// convertStringToPaiKind('m') => PaiKind.manzu
  static PaiKind _convertStringToPaiKind(String kindStr) {
    switch (kindStr) {
      case 'm':
        return PaiKind.manzu;
      case 's':
        return PaiKind.sozu;
      case 'p':
        return PaiKind.pinzu;
      case 'z':
        return PaiKind.jihai;
      default:
        throw ArgumentError('Invalid input: $kindStr');
    }
  }

  /// createJihai('東') => Pai{1z}
  static Pai createJihai(String jihaiStr) {
    int index = jihaiString.indexOf(jihaiStr);
    if (index == -1) {
      throw ArgumentError('Invalid jihaiStr: $jihaiStr');
    }
    int num = index + 1;
    return createPai('z', num.toString());
  }
}
