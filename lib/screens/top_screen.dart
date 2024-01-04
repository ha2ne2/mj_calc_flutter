import 'package:flutter/material.dart';
import 'package:mj_calc_flutter/screens/point_calc_screen.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({super.key});

  @override
  State<TopScreen> createState() => _TopScreentate();
}

class _TopScreentate extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('麻雀 点数計算 練習アプリ'),
        ),
        // NOTE: これの意味がわからない
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const PointCalcScreen()),
                    ),
                  );
                },
                child: const Text("点数計算")),
            ElevatedButton(onPressed: () {}, child: const Text("符計算")),
            ElevatedButton(onPressed: () {}, child: const Text("翻計算")),
            ElevatedButton(onPressed: () {}, child: const Text("点数表暗記")),
          ],
        ));
  }
}
