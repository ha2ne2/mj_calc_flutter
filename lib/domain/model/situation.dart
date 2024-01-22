import 'package:mj_calc_flutter/domain/model/pai.dart';
import 'package:mj_calc_flutter/domain/model/yaku.dart';

class Situation {
  final String ba;
  final int kyoku;
  final int honba;
  final String ie;
  final PaiGroup dora;
  final PaiGroup uraDora;
  final bool oya;
  final List<Yaku> situationalYaku;
  Situation(
      {required this.ba,
      required this.kyoku,
      required this.honba,
      required this.ie,
      required this.dora,
      required this.uraDora,
      required this.oya,
      required this.situationalYaku});
}
