import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/local_storage/app_storage_pod.dart';
import 'package:tic_tac_toe/features/game_history/controller/game_history_pod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/controller/tic_tac_toe_pod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/model/tic_tac_model.dart';

class TicTacToeNotifier extends AutoDisposeNotifier<TicTacToeState> {
  final _dbKey = 'tic_tac_state';

  ///Intitalize the board with default size as given with empty string,
  ///so the startin turn will have for the  player 1 and game finished should be false.
  @override
  TicTacToeState build() {
    final initialState = ref.watch(initialTicTacStatePod);

    ref.listenSelf((previous, next) async {
      if (next.isGameFinished && next.matchStatus != MatchOwnType.CONTINUING) {
        await ref
            .read(appStorageProvider)
            .put(key: _dbKey, value: initialState.toJson());
      } else {
        await ref
            .read(appStorageProvider)
            .put(key: _dbKey, value: state.toJson());
      }
    });
    final dbData = ref.read(appStorageProvider).get(
          key: _dbKey,
        );
    if (dbData != null) {
      return TicTacToeState.fromJson(dbData);
    } else {
      return initialState;
    }
  }

  void makeMove(int index) {
    ///check the game is not finished and current index cell should be empty i.e; not filled
    if (!state.isGameFinished && state.board[index] == '') {
      ///create a new bord from the current state
      final newBoard = List.of(state.board);

      ///Update the new board index according to turn
      newBoard[index] = state.isPlayer1Turn ? 'X' : 'O';

      ///for every change check the winner
      checkWinner(newBoard);
      final newState = state.copyWith(
        board: newBoard,
        isPlayer1Turn: !state.isPlayer1Turn,
      );

      if (!newState.isGameFinished && !newState.isPlayer1Turn) {
        Future.delayed(const Duration(milliseconds: 300), () {
          makeComputerMove(newBoard);
        });
      }

      state = newState;
    }
  }

  void makeComputerMove(List<String> currentBoard) {
    final availableMoves = <int>[];
    for (int i = 0; i < currentBoard.length; i++) {
      if (currentBoard[i] == '') {
        availableMoves.add(i);
      }
    }

    if (availableMoves.isNotEmpty) {
      final randomIndex = Random().nextInt(availableMoves.length);
      makeMove(availableMoves[randomIndex]);
    }
  }

  void checkWinner(List<String> board) {
    ///get all the winning patterns
    final winningPatterns = generateWinningPatterns();

    ///check the pattern
    for (final pattern in winningPatterns) {
      /// map every patterns index with board,
      /// get all pattern indexed item and convert it to set for removing duplication

      final cells = pattern.map((index) => board[index]).toSet();

      ///if we are getting length 1 & first cell is not empty,
      ///means other cells in the pattern have the same data
      ///then make the game finished to true
      ///and if result fist cell contains 'X'  then user wins else the bot
      if (cells.length == 1 && cells.first.isNotEmpty) {
        state = state.copyWith(
          isGameFinished: true,
          matchStatus:
              cells.first == 'X' ? MatchOwnType.USER : MatchOwnType.BOT,
        );
        ref.read(gameHistoryProvider.notifier).saveGameState(state);
        return;
      }
    }

    // if no winning pattern matches
    // check all are filled and game not finished, and make game finished true
    // match sttaus to draw
    // Check for a draw only if no winner has been found
    if (!board.contains('') && !state.isGameFinished) {
      state =
          state.copyWith(isGameFinished: true, matchStatus: MatchOwnType.DRAW);
      ref.read(gameHistoryProvider.notifier).saveGameState(state);
    }
  }

  ///reset the game to start
  void resetGame() {
    state = TicTacToeState(
      board: List.filled(ref.watch(defaultBoardSizePod), ''),
      isPlayer1Turn: true,
      isGameFinished: false,
      matchStatus: MatchOwnType.CONTINUING,
    );
  }

  /// winning patterns for 3 x 3 board
  List<List<int>> generateWinningPatterns() {
    return [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6] // Diagonals
    ];
  }
}
