import 'package:flutter/material.dart';

class PointCalcScreen extends StatefulWidget {
  const PointCalcScreen({super.key});

  @override
  State<PointCalcScreen> createState() => _PointCalcState();
}

class _PointCalcState extends State<PointCalcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('点数計算 練習'),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("開始")),
          ],
        ));
  }
}
