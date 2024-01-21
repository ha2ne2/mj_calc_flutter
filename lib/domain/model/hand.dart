import 'package:mj_calc_flutter/domain/model/pai.dart';

/// 手牌のモデル
// TODO: リファクタリング出来る箇所がたくさんある
class Hand {
  final String ba;
  final int kyoku;
  final int honba;
  final String ie;
  final List<Pai> dora;
  final List<Pai> uraDora;
  final bool oya;
  final List<String> situationalYaku;
  final List<Pai> menzen;
  final List<List<Pai>> naki;
  final List<List<Pai>> tii;
  final List<List<Pai>> pon;
  final List<List<Pai>> kan;
  final List<List<Pai>> ankan;
  final List<String> aka;
  final String string;
  final Pai? ron;
  final Pai? tumo;

  Hand(
      {required this.ba,
      required this.kyoku,
      required this.honba,
      required this.ie,
      required this.dora,
      required this.uraDora,
      required this.oya,
      required this.situationalYaku,
      required this.menzen,
      required this.naki,
      required this.tii,
      required this.pon,
      required this.kan,
      required this.ankan,
      required this.aka,
      required this.string,
      required this.ron,
      required this.tumo});
}
