import 'dart:collection';

import 'package:mj_calc_flutter/domain/model/pai.dart';
import 'package:mj_calc_flutter/domain/utils/pai_utils.dart';
import 'package:mj_calc_flutter/domain/utils/string_utils.dart';

class PaiGroupUtils {
  static bool isToitu(List<Pai> paiList) {
    return true;
  }

  static bool isKoutu(List<Pai> paiList) {
    return true;
  }

  static bool isKantu(List<Pai> paiList) {
    return true;
  }

  static bool isShuntu(List<Pai> paiList) {
    return true;
  }

  /// f("123s4567m白発") => List<Pai>
  static List<Pai> parsePaiString(String s) {
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

  /// f("1111m' 123s 456m") => {"tii": [[1s, 2s, 3s],[4m, 5m, 6m]], "ankan": [[1m 1m 1m 1m]]}
  /// TODO: LinkedHashMap<String, List<List<Pai>>>に型をつけたほうがよい？
  static LinkedHashMap<String, List<List<Pai>>> parseNakiString(
      List<String> nakiStrList) {
    final LinkedHashMap<String, List<List<Pai>>> hashmap = LinkedHashMap();
    hashmap["tii"] = [];
    hashmap["pon"] = [];
    hashmap["minkan"] = [];
    hashmap["ankan"] = [];
    // ↑ の[]はなんでList<List<Pai>>扱いされるんだ？
    // 実行時エラーにならない？あるいはプリミティブなリテラルだから
    // その辺まで考慮されているか。

    for (var nakiStr in nakiStrList) {
      final paiList = parsePaiString(nakiStr);
      if (isShuntu(paiList)) {
        hashmap["tii"]!.add(paiList);
      } else if (isKoutu(paiList)) {
        hashmap["pon"]!.add(paiList);
      } else if (isKantu(paiList)) {
        if (nakiStr.endsWith('\'')) {
          hashmap["ankan"]!.add(paiList);
        } else {
          hashmap["minkan"]!.add(paiList);
        }
      }
    }
    return hashmap;
  }

  /// "123s" => [Pai{1s}, Pai{2s}, Pai{3s}]
  /// "東" => [Pai{1z}]
  static List<Pai> _parsePaiGroupString(String s) {
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
