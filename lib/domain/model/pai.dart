/// 牌モデル

/// 萬子: 1m - 9m
/// 索子: 1s - 9s
/// 筒子: 1p - 9p
/// 東南西北白発中: 1z - 7z
class Pai {
  final PaiKind kind;
  final int num;
  final bool aka;
  const Pai({required this.kind, required this.num, this.aka = false});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pai &&
          runtimeType == other.runtimeType &&
          kind == other.kind &&
          num == other.num;

  @override
  int get hashCode => kind.hashCode ^ num.hashCode;

  @override
  String toString() {
    return '($kind $num)';
  }
}

enum PaiKind {
  manzu('m'),
  sozu('s'),
  pinzu('p'),
  jihai('z');

  final String s;
  const PaiKind(this.s);

  @override
  String toString() => s;
}

typedef PaiGroup = List<Pai>;
const jihaiString = "東南西北白発中";
