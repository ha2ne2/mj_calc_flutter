import 'package:flutter/foundation.dart';
import 'package:mj_calc_flutter/domain/model/pai.dart';
import 'package:mj_calc_flutter/domain/utils/pai_utils.dart';
import 'package:mj_calc_flutter/domain/utils/string_utils.dart';

class PaiGroupUtils {
  static final Set<Pai> huuhai = {
    PaiUtils.createJihai('東'),
    PaiUtils.createJihai('南'),
    PaiUtils.createJihai('西'),
    PaiUtils.createJihai('北'),
  };

  static final Set<Pai> yakuhai = {
    PaiUtils.createJihai('白'),
    PaiUtils.createJihai('発'),
    PaiUtils.createJihai('中')
  };

  static final Set<Pai> jihaiSet = huuhai.union(yakuhai);

  static bool isJihai(Pai pai) {
    return jihaiSet.contains(pai);
  }

  static bool isToitu(PaiGroup paiGroup) {
    return paiGroup.length == 2 && paiGroup[0] == paiGroup[1];
  }

  static bool isKoutu(PaiGroup paiGroup) {
    return paiGroup.length == 3 &&
        paiGroup[0] == paiGroup[1] &&
        paiGroup[1] == paiGroup[2];
  }

  static bool isKantu(PaiGroup paiGroup) {
    return paiGroup.length == 4 &&
        paiGroup[0] == paiGroup[1] &&
        paiGroup[1] == paiGroup[2] &&
        paiGroup[2] == paiGroup[3];
  }

  static bool isShuntu(PaiGroup paiGroup) {
    if (paiGroup.length != 3) {
      return false;
    }

    final kind = paiGroup[0].kind;
    final num = paiGroup[0].num;

    return listEquals(paiGroup, [
      Pai(kind: kind, num: num),
      Pai(kind: kind, num: num + 1),
      Pai(kind: kind, num: num + 2)
    ]);
  }

  /// f("123s4567m白発") => PaiGroup
  static PaiGroup parse(String s) {
    RegExp regex = RegExp(r'\d+\w|\W');

    final String targetString;
    if (s.endsWith('\'')) {
      targetString = s.substring(0, s.length - 1);
    } else {
      targetString = s;
    }
    final stringList = StringUtils.reSeq(regex, targetString);
    return stringList.expand(_parsePaiGroupString).toList();
  }

  /// 鳴き部分の文字列を解析してLinkedHashMapにして返す
  /// f("1111m' 123s 456m") => {"tii": [[1s, 2s, 3s],[4m, 5m, 6m]], "ankan": [[1m 1m 1m 1m]]}
  /// TODO: もっときれいに書きたい
  static ({
    List<PaiGroup> tii,
    List<PaiGroup> pon,
    List<PaiGroup> minkan,
    List<PaiGroup> ankan
  }) parseNaki(List<String> nakiStrList) {
    List<PaiGroup> tii = [];
    List<PaiGroup> pon = [];
    List<PaiGroup> minkan = [];
    List<PaiGroup> ankan = [];
    // ↑ の[]はなんでList<PaiGroup>扱いされるんだ？

    for (var nakiStr in nakiStrList) {
      final paiList = parse(nakiStr);
      if (isShuntu(paiList)) {
        tii.add(paiList);
      } else if (isKoutu(paiList)) {
        pon.add(paiList);
      } else if (isKantu(paiList)) {
        if (nakiStr.endsWith('\'')) {
          ankan.add(paiList);
        } else {
          minkan.add(paiList);
        }
      }
    }
    return (tii: tii, pon: pon, minkan: minkan, ankan: ankan);
  }

  /// "123456s"のような部分文字列を引数にとりPaiGroupを返す
  /// "123s" => [Pai{1s}, Pai{2s}, Pai{3s}]
  /// "東" => [Pai{1z}]
  static PaiGroup _parsePaiGroupString(String s) {
    if (s.length == 1) {
      return [PaiUtils.createJihai(s)];
    }

    final paiKind = s[s.length - 1];
    if (paiKind != 'm' && paiKind != 's' && paiKind != 'p' && paiKind != 'z') {
      throw ArgumentError('Invalid args: $s');
    }
    final nums = s.substring(0, s.length - 1);
    final paiList = nums.split('').map((n) {
      return PaiUtils.createPai(paiKind, n);
    }).toList();

    return paiList;
  }
}
