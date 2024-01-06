import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum GameState { ready, playing, ended }

@immutable
class PointCalcScreenState {
  const PointCalcScreenState(
      {this.solvedCount = 0,
      this.problemsCount = 0,
      this.gameState = GameState.ready});

  //final List<Problem> problemList;
  final int solvedCount;
  final int problemsCount;
  final GameState gameState;

  PointCalcScreenState copyWith(
      {int? solvedCount, int? problemsCount, GameState? gameState}) {
    return PointCalcScreenState(
        solvedCount: solvedCount ?? this.solvedCount,
        problemsCount: problemsCount ?? this.problemsCount,
        gameState: gameState ?? this.gameState);
  }

  @override
  String toString() {
    return "gameState: $gameState, solvedCount: $solvedCount, problemsCount: $problemsCount";
  }
}

class PointCalcScreenStateNotifier extends StateNotifier<PointCalcScreenState> {
  PointCalcScreenStateNotifier() : super(const PointCalcScreenState());

  void gameStart() {
    state = state.copyWith(
        gameState: GameState.playing, solvedCount: 0, problemsCount: 10);
  }

  void gameCancel() {
    state = state.copyWith(
        gameState: GameState.ready, solvedCount: 0, problemsCount: 0);
  }

  void answer() {
    debugPrint(state.toString());
    state = state.copyWith(solvedCount: state.solvedCount + 1);
  }

  /*
  void increment() {
    // ⑥ 新しい状態をセットすることで変更が通知される。
    state = state.copyWith(isLoading: true);
    Future.delayed(const Duration(seconds: 1)).then((_) {
      state = state.copyWith(count: state.count + 1);
    }).whenComplete(() {
      state = state.copyWith(isLoading: false);
    });
  }
  */
}

final pointCalcScreenProvider =
    StateNotifierProvider<PointCalcScreenStateNotifier, PointCalcScreenState>(
        (ref) {
  return PointCalcScreenStateNotifier();
});
