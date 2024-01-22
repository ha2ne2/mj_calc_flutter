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
}
