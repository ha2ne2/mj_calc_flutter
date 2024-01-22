import 'package:mj_calc_flutter/domain/model/pai.dart';
import 'package:mj_calc_flutter/domain/model/situation.dart';

/// 手牌のモデル
class Hand {
  final Situation situation;
  final PaiGroup menzen;
  final List<PaiGroup> naki;
  final List<PaiGroup> tii;
  final List<PaiGroup> pon;
  final List<PaiGroup> kan;
  final List<PaiGroup> ankan;
  final List<PaiKind> akadora;
  final String string;
  final Pai? ron;
  final Pai? tumo;

  Hand(
      {required this.situation,
      required this.menzen,
      required this.naki,
      required this.tii,
      required this.pon,
      required this.kan,
      required this.ankan,
      required this.akadora,
      required this.string,
      required this.ron,
      required this.tumo});

  @override
  String toString() {
    return 'Hand(situation: $situation, menzen: $menzen, naki: $naki, tii: $tii, pon: $pon, kan: $kan, ankan: $ankan, akadora: $akadora, string: $string, ron: $ron, tumo: $tumo)';
  }

  /// オーバーライドサンプル
  /*
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Hand &&
        other.situation == situation &&
        listEquals(other.menzen, menzen) &&
        listEquals(other.naki, naki) &&
        listEquals(other.tii, tii) &&
        listEquals(other.pon, pon) &&
        listEquals(other.kan, kan) &&
        listEquals(other.ankan, ankan) &&
        listEquals(other.akadora, akadora) &&
        other.string == string &&
        other.ron == ron &&
        other.tumo == tumo;
  }

  @override
  int get hashCode {
    return situation.hashCode ^
        menzen.hashCode ^
        naki.hashCode ^
        tii.hashCode ^
        pon.hashCode ^
        kan.hashCode ^
        ankan.hashCode ^
        akadora.hashCode ^
        string.hashCode ^
        ron.hashCode ^
        tumo.hashCode;
  }
  */
}
