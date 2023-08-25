import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/local_storage/app_storage_pod.dart';
import 'package:tic_tac_toe/features/game_history/model/game_history_model.dart';
import 'package:tic_tac_toe/features/tic_tac_board/model/tic_tac_model.dart';

class GameHistoryListNotifier extends AutoDisposeNotifier<GameHistories> {
  final _gameHistoryKey = 'gamehistory';
  @override
  GameHistories build() {
    final data = ref.watch(appStorageProvider).get(key: _gameHistoryKey);
    if (data != null) {
      return GameHistories.fromJson(data);
    } else {
      return GameHistories(gameHistoies: []);
    }
  }

  void saveGameState(TicTacToeState ticTacToeState) async {
    final newState = [
      ...state.gameHistoies,
      GameHistoryModel(
        dateTime: DateTime.now(),
        ticTacToeState: ticTacToeState,
      )
    ].toList();
    state = GameHistories(gameHistoies: newState);
    await ref
        .read(appStorageProvider)
        .put(key: _gameHistoryKey, value: state.toJson());
  }
}
