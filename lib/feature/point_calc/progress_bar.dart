import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mj_calc_flutter/feature/point_calc/point_calc_state.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final count = ref.watch(pointCalcStateProvider.select((state) {
        return state.solvedCount;
      }));
      final total = ref.watch(pointCalcStateProvider.select((state) {
        return state.problemsCount;
      }));
      debugPrint((total != 0) ? (count / total).toString() : 0.toString());
      return LinearProgressIndicator(
        backgroundColor: Colors.grey,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        minHeight: 15,
        value: total != 0 ? count / total : 0,
      );
    });
  }
}
