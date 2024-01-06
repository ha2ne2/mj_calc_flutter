import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mj_calc_flutter/components/radio_group.dart';
import 'package:mj_calc_flutter/feature/point_calc/progress_bar.dart';
import 'package:mj_calc_flutter/feature/point_calc/point_calc_state.dart';

class PointCalcPage extends StatelessWidget {
  const PointCalcPage({super.key});

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

    var consumer = Consumer(builder: (context, ref, child) {
      final notifier = ref.read(pointCalcStateProvider.notifier);
      final gameState = ref.watch(pointCalcStateProvider.select((state) {
        return state.gameState;
      }));

      // Readyのときに表示するコンポーネント
      var readyComponent =
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ElevatedButton(
            onPressed: () {
              notifier.gameStart();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text("開始")),
        const Text("実践によく出る問題が10問出題されます。\n間違えた問題はもう一度出題されます。")
      ]);

      // プレイ中に表示するコンポーネント
      var playingComponent =
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ElevatedButton(
            onPressed: () {
              notifier.gameCancel();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text("中止")),
        const ProgressBar(),
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
            )),
        ElevatedButton(
            onPressed: () {
              notifier.answer();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text("回答")),
      ]);

      // ゲーム終了時に表示するコンポーネント
      var endedComponent =
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ElevatedButton(
            onPressed: () {
              notifier.gameStart();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text("開始")),
        const Text("ended")
      ]);
      return Container(
          padding: const EdgeInsets.all(8.0),
          child: (gameState == GameState.ready)
              ? readyComponent
              : (gameState == GameState.playing)
                  ? playingComponent
                  : endedComponent);
    });

    return ProviderScope(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('点数計算 練習'),
      ),
      body: consumer,
    ));
  }
}
