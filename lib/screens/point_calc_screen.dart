import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mj_calc_flutter/components/progress_bar.dart';
import 'package:mj_calc_flutter/screens/point_calc_screen_state.dart';

class PointCalcScreen extends StatelessWidget {
  const PointCalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var consumer = Consumer(builder: (context, ref, child) {
      final notifier = ref.read(pointCalcScreenProvider.notifier);
      final gameState = ref.watch(pointCalcScreenProvider.select((state) {
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
        const Text("実践によく出る問題が重問出題されます。\n間違えた問題はもう一度出題されます。")
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
      var endedComponent = const Text("ended");

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
