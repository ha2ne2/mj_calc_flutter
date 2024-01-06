import 'package:flutter/material.dart';
import 'package:mj_calc_flutter/components/radio_group.dart';

class PointCalcScreenDummy extends StatefulWidget {
  const PointCalcScreenDummy({super.key});

  @override
  State<PointCalcScreenDummy> createState() => _PointCalcStateDummy();
}

class _PointCalcStateDummy extends State<PointCalcScreenDummy> {
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

    const huList = RadioGroups(title: "符", candidates: [
      "20",
      "25",
      "30",
      "40",
      "50",
      "60",
      "70",
      "80-",
    ]);

    const hanList = RadioGroups(title: "翻", candidates: [
      "1",
      "2",
      "3",
      "4-5",
      "6-7",
      "8-10",
      "11-12",
      "13-",
    ]);

    const pointList = RadioGroups(title: "点", candidates: [
      "1300",
      "2300",
      "2600",
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "東4局南家",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const Text(
              "場役：立直",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "ドラ表示牌:",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Image.asset("images/pai/z2.png"),
              const Text(
                "裏ドラ表示牌:",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Image.asset("images/pai/z3.png")
            ]),
            paiList,
            const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Expanded(child: huList),
                    Expanded(child: hanList),
                    Expanded(child: pointList)
                  ],
                ))
          ])),
    );
  }
}
