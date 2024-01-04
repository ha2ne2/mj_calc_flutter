import 'package:flutter/material.dart';
import 'package:mj_calc_flutter/components/radio_group.dart';

class PointCalcScreen extends StatefulWidget {
  const PointCalcScreen({super.key});

  @override
  State<PointCalcScreen> createState() => _PointCalcState();
}

class _PointCalcState extends State<PointCalcScreen> {
  @override
  Widget build(BuildContext context) {
    var paiList = ListView(
        shrinkWrap: true, // 中身のコンテンツに合わせてサイズを自動調整
        children: [
          // Row内に14個の画像
          Row(children: [
            Expanded(
              child: Image.asset('images/pai/m1.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/m2.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/m3.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/m4.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/m5.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/m6.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/m7.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/m8.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/m9.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/s1.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/s2.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/s3.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/z1.png'),
            ),
            Expanded(
              child: Image.asset('images/pai/z1.png'),
            ),
          ])
        ]);

    const huList = RadioGroups(candidates: [
      "20",
      "25",
      "30",
      "40",
      "50",
      "60",
      "70",
      "80-",
    ]);

    const hanList = RadioGroups(candidates: [
      "1",
      "2",
      "3",
      "4-5",
      "6-7",
      "8-10",
      "11-12",
      "13-",
    ]);

    const pointList = RadioGroups(candidates: [
      "1300",
      "2300",
      "3900",
      "5200",
      "6400",
      "8000",
      "12000",
    ]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('点数計算 練習'),
      ),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text("東4局南家"),
            const Text("場役：立直"),
            Row(children: [
              const Text("ドラ表示牌:"),
              Image.asset("images/pai/z2.png"),
              const Text("裏ドラ表示牌:"),
              Image.asset("images/pai/z3.png")
            ]),
            paiList,
            const Row(
              children: [
                Expanded(child: huList),
                Expanded(child: hanList),
                Expanded(child: pointList)
              ],
            )
          ])),
    );
  }
}
