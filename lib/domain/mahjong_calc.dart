import 'package:mj_calc_flutter/domain/model/hand.dart';
import 'package:mj_calc_flutter/domain/model/situation.dart';
import 'package:mj_calc_flutter/domain/model/yaku.dart';
import 'package:mj_calc_flutter/domain/utils/pai_group_utils.dart';
import 'package:mj_calc_flutter/domain/model/pai.dart';
import 'package:mj_calc_flutter/domain/utils/pai_utils.dart';

class MahjongPointCalc {
  /// f("123s4567m白発") => PaiGroup
  // e.g. fromString("678m11345789p45s 3s:南4局北家ドラ1m")
  static Hand parseString(String s) {
    List<String> splitTehaiInfo = s.split(':');
    String tehai = splitTehaiInfo[0].trim();
    String info = splitTehaiInfo[1].trim();
    List<String> splitTehai = tehai.split(RegExp(r'[ |_]'));
    // 門前部分を表す文字列
    String menzenStr = splitTehai[0];
    // 鳴き部分を表す文字列
    List<String> nakiStrList = splitTehai.sublist(1);
    // 上がり牌を表す文字列
    String? agariHaiStr = nakiStrList.lastOrNull;

    // 1
    // TODO: 何に使っているか不明
    // 赤ドラの抽出 akadoraの中身は["m", "p"]等になる
    List<PaiKind> akadora = RegExp(r'0.*?([mps])')
        .allMatches(s)
        .map((m) => PaiUtils.convertStringToPaiKind(m.group(1)!))
        .toList();

    // 2 場情報のパース
    final situation = parseSituation(info);

    // 3 門前部分のパース
    PaiGroup menzen = PaiGroupUtils.parse(menzenStr);

    // 4 鳴き部分のパース
    final nakiRecord = PaiGroupUtils.parseNaki(nakiStrList);
    final List<PaiGroup> naki = [];
    naki.addAll(nakiRecord.tii);
    naki.addAll(nakiRecord.pon);
    naki.addAll(nakiRecord.ankan);
    naki.addAll(nakiRecord.minkan);

    // 5 ツモかロンかの判定処理
    // TODO: もっときれいに書けるはず
    Pai? tumo;
    Pai? ron;
    if (agariHaiStr != null) {
      final agariHaiList = PaiGroupUtils.parse(agariHaiStr);
      if (agariHaiList.length == 1) {
        if (agariHaiStr.endsWith('\'')) {
          tumo = agariHaiList[0];
        } else {
          ron = agariHaiList[0];
        }
      }
    }

    final hand = Hand(
        situation: situation,
        menzen: menzen,
        naki: naki,
        tii: nakiRecord.tii,
        pon: nakiRecord.pon,
        kan: nakiRecord.minkan,
        ankan: nakiRecord.ankan,
        akadora: akadora,
        string: s,
        ron: ron,
        tumo: tumo);

    return hand;
  }

  static Situation parseSituation(String info) {
    final bool oya = RegExp(r"親").hasMatch(info);
    final ba = RegExp(r"(東|南|西|北)(\d)局").firstMatch(info);
    final honba = RegExp(r"(\d+)本場").firstMatch(info);
    final ie = RegExp(r"(.)家").firstMatch(info);
    final dora = RegExp(r"ドラ(.+?)($|裏)").firstMatch(info);
    final uraDora = RegExp(r"裏ドラ(.+)$").firstMatch(info);

    var aux = <Yaku>[];
    if (RegExp(r"立直").hasMatch(info)) {
      aux.add(RegExp(r"両立直").hasMatch(info) ? (2, '両立直') : (1, '立直'));
    }
    if (RegExp(r"一発").hasMatch(info)) {
      aux.add((1, '一発'));
    }
    if (RegExp(r"嶺上").hasMatch(info)) {
      aux.add((1, '嶺上開花'));
    }
    if (RegExp(r"槍槓").hasMatch(info)) {
      aux.add((1, '槍槓'));
    }
    if (RegExp(r"海底").hasMatch(info)) {
      aux.add((1, '海底撈月'));
    }
    if (RegExp(r"河底").hasMatch(info)) {
      aux.add((1, '河底撈魚'));
    }

    return Situation(
      ba: ba != null ? ba.group(1)! : '東',
      kyoku: ba != null ? int.parse(ba.group(2)!) : 1,
      honba: honba != null ? int.parse(honba.group(1)!) : 0,
      ie: ie != null ? ie.group(1)! : '南',
      dora: dora != null ? PaiGroupUtils.parse(dora.group(1)!) : [],
      uraDora: uraDora != null ? PaiGroupUtils.parse(uraDora.group(1)!) : [],
      oya: ie != null && ie.group(1) == "東" || oya,
      situationalYaku: aux,
    );
  }
}
