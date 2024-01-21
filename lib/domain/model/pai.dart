/// 牌モデル

enum PaiKind { manzu, sozu, pinzu, jihai }

const jihaiString = "東南西北白発中";

/// 萬子: 1m - 9m
/// 索子: 1s - 9s
/// 筒子: 1p - 9p
/// 東南西北白発中: 1z - 7z
class Pai {
  final PaiKind kind;
  final int num;
  final bool aka;
  const Pai({required this.kind, required this.num, required this.aka});

  /// 同じ牌かどうかを判断する関数
  // ==メソッドをオーバーライドをしない理由はbool akaがあるため
  bool isEquivalentTo(Pai other) {
    return kind == other.kind && num == other.num;
  }
}
