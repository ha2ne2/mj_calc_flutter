import 'dart:collection';

import 'package:mj_calc_flutter/domain/model/hand.dart';
import 'package:mj_calc_flutter/domain/utils/list_utils.dart';
import 'package:mj_calc_flutter/domain/utils/pai_group_utils.dart';
import 'package:mj_calc_flutter/domain/model/pai.dart';

class MahjongPointCalc {
  /*
  static List<Pai> fromString(String s) {
    return [];
  }
  */

  // 文字列を画面に表示するまでのフロー
  // 1. (to-list "678m11345789p45s 3s:南4局北家ドラ1m")

  /*
  ;; string -> [pai]
(defn to-list [s]
  (let [[tehai info] (split s #":")]
    (let [[a & b] (split tehai #" |_")]
      (let [akadora (map (comp symbol second) (re-seq #"0.*?([mps])" s))
            info (read-info info)
            menzen (to-list* a)
            naki (empty-to-nil (map to-list* (butlast b)))
            hu-ro (map naki-to-list (butlast b)) ;; 改良の余地がある また今度
            ho-ra (tumo-or-ron (last b))
            hand (array-map :menzen menzen :naki naki :aka akadora :string s)
            
            ;; ((:ti- ((m 1) (m 2) (m 3))) (:ti- ((s 7) (s 8) (s 9)))) を (:ti- (((s 7) (s 8) (s 9)) ((m 1) (m 2) (m 3))))としてまとめる
            hand2 (if hu-ro (reduce (fn [m naki] (ana-assoc m (first naki) (conj it (second naki))))
                                    hand
                                    hu-ro)
                      hand)
            hand3 (if ho-ra (concat-array-map
                             hand2
                             (array-map (first ho-ra) (second ho-ra)))
                      hand2)]
        ;; into を使うとhash-mapに変換されてしまう
        (concat-array-map info hand3)
        ))))
        */

  /// f("123s4567m白発") => List<Pai>
  // e.g. fromString("678m11345789p45s 3s:南4局北家ドラ1m")
  static Hand parseString(String s) {
    List<String> splitTehaiInfo = s.split(':');
    String tehai = splitTehaiInfo[0].trim();
    String info = splitTehaiInfo[1].trim();
    List<String> splitTehai = tehai.split(RegExp(r'[ |_]'));
    // 門前部分を表す文字列
    String menzenStr = splitTehai[0];
    // 鳴き部分を表す文字列。最後の部分は上がり牌を表すため除外。
    List<String> nakiStrList = ListUtils.removeFirstAndLast(splitTehai);

    // 1
    // TODO: 何に使っているか不明
    // 赤ドラの抽出 akadoraの中身は["m", "p"]等になる
    List<String> akadora = RegExp(r'0.*?([mps])')
        .allMatches(s)
        .map((m) => m.group(1)!) // allMatchesを使っているのでキャストは安全
        .toList();

    // 2 場情報のパース
    // TODO: need to implement
    // List<String> infoList = readInfo(info);

    // 3 門前部分のパース
    List<Pai> menzen = PaiGroupUtils.parsePaiString(menzenStr);

    // 4 鳴き部分のパース
    final LinkedHashMap<String, List<List<Pai>>> nakiMap =
        PaiGroupUtils.parseNakiString(nakiStrList);
    final List<List<Pai>> naki = [];
    naki.addAll(nakiMap["tii"]!);
    naki.addAll(nakiMap["pon"]!);
    naki.addAll(nakiMap["ankan"]!);
    naki.addAll(nakiMap["minkan"]!);

    // 5 ツモかロンかの判定処理
    // TODO: need to implement
    // List<String> hora = tumoOrRon(b.last);

    /*
    // 6
    Map<String, dynamic> hand = {
      'menzen': menzen,
      'naki': naki,
      'aka': akadora.map((s) => Symbol(s)).toList(),
      'string': s,
    };

    // 7
    Map<String, dynamic> hand2 = huro.isNotEmpty
        ? huro.fold(
            hand,
            (m, naki) => anaAssoc(
                m,
                naki[0],
                (m, n) => m
                  ..[n] = (m[n] as List<dynamic>?)?.toList()
                  ..add(naki[1])))
        : hand;

    // 8
    Map<String, dynamic> hand3 = hora.isNotEmpty
        ? concatArrayMap(hand2, {
            hora[0]: hora[1],
          })
        : hand2;

    // 9
    Map<String, dynamic> result =
        Map.fromEntries(concatArrayMap(infoList, hand3).entries);

    return result;
    */

    final hand = Hand(
        ba: '',
        kyoku: 1,
        honba: 1,
        ie: '',
        dora: [],
        uraDora: [],
        oya: true,
        situationalYaku: [],
        menzen: menzen,
        naki: naki,
        tii: nakiMap["tii"]!,
        pon: nakiMap["pon"]!,
        kan: nakiMap["minkan"]!,
        ankan: nakiMap["ankan"]!,
        aka: [],
        string: '',
        ron: null,
        tumo: null);

    return hand;
  }
}
