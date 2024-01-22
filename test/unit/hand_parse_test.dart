import 'package:flutter_test/flutter_test.dart';
import 'package:mj_calc_flutter/domain/mahjong_calc.dart';

void main() {
  test('parse hand', () {
    String hand = "44678m34s 111m 789s 2s:東4局1本場東家立直一発ドラ7m8m白裏ドラ8m7s発";
    String s =
        "Hand(situation: Instance of 'Situation', menzen: [(m 4), (m 4), (m 6), (m 7), (m 8), (s 3), (s 4)], naki: [[(s 7), (s 8), (s 9)], [(m 1), (m 1), (m 1)]], tii: [[(s 7), (s 8), (s 9)]], pon: [[(m 1), (m 1), (m 1)]], kan: [], ankan: [], akadora: [], string: 44678m34s 111m 789s 2s:東4局1本場東家立直一発ドラ7m8m白裏ドラ8m7s発, ron: (s 2), tumo: null)";
    expect(MahjongPointCalc.parseString(hand).toString(), s);
  });

  test('parse hand2', () {
    String hand = "44678m34s 111m 789s 2s':東4局1本場東家立直一発ドラ7m8m白裏ドラ8m7s発";
    String s =
        "Hand(situation: Instance of 'Situation', menzen: [(m 4), (m 4), (m 6), (m 7), (m 8), (s 3), (s 4)], naki: [[(s 7), (s 8), (s 9)], [(m 1), (m 1), (m 1)]], tii: [[(s 7), (s 8), (s 9)]], pon: [[(m 1), (m 1), (m 1)]], kan: [], ankan: [], akadora: [], string: 44678m34s 111m 789s 2s':東4局1本場東家立直一発ドラ7m8m白裏ドラ8m7s発, ron: null, tumo: (s 2))";
    expect(MahjongPointCalc.parseString(hand).toString(), s);
  });

  test('parse hand minkan', () {
    String hand = "44678m34s 1111m 789s 2s':東4局1本場東家立直一発ドラ7m8m白裏ドラ8m7s発";
    String s =
        "Hand(situation: Instance of 'Situation', menzen: [(m 4), (m 4), (m 6), (m 7), (m 8), (s 3), (s 4)], naki: [[(s 7), (s 8), (s 9)], [(m 1), (m 1), (m 1), (m 1)]], tii: [[(s 7), (s 8), (s 9)]], pon: [], kan: [[(m 1), (m 1), (m 1), (m 1)]], ankan: [], akadora: [], string: 44678m34s 1111m 789s 2s':東4局1本場東家立直一発ドラ7m8m白裏ドラ8m7s発, ron: null, tumo: (s 2))";
    expect(MahjongPointCalc.parseString(hand).toString(), s);
  });

  test('parse hand ankan', () {
    String hand = "44678m34s 1111m' 789s 2s':東4局1本場東家立直一発ドラ7m8m白裏ドラ8m7s発";
    String s =
        "Hand(situation: Instance of 'Situation', menzen: [(m 4), (m 4), (m 6), (m 7), (m 8), (s 3), (s 4)], naki: [[(s 7), (s 8), (s 9)], [(m 1), (m 1), (m 1), (m 1)]], tii: [[(s 7), (s 8), (s 9)]], pon: [], kan: [], ankan: [[(m 1), (m 1), (m 1), (m 1)]], akadora: [], string: 44678m34s 1111m' 789s 2s':東4局1本場東家立直一発ドラ7m8m白裏ドラ8m7s発, ron: null, tumo: (s 2))";
    expect(MahjongPointCalc.parseString(hand).toString(), s);
  });
}
