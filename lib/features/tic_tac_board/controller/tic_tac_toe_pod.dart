// ignore_for_file: constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/controller/notifier/tic_tac_notifier.dart';
import 'package:tic_tac_toe/features/tic_tac_board/model/tic_tac_model.dart';

final ticTacToePod =
    NotifierProvider.autoDispose<TicTacToeNotifier, TicTacToeState>(
  TicTacToeNotifier.new,
  name: 'ticTacToePod',
);

final initialTicTacStatePod = Provider.autoDispose<TicTacToeState>((ref) {
  return TicTacToeState(
    board: List.filled(ref.watch(defaultBoardSizePod), ''),
    isPlayer1Turn: true,
    isGameFinished: false,
    matchStatus: MatchOwnType.CONTINUING,
  );
});

final defaultBoardSizePod = StateProvider.autoDispose<int>(
  (ref) {
    return 9;
  },
  name: 'defaultBoardSizeProvider',
);
