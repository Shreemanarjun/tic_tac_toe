import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/controller/tic_tac_toe_pod.dart';

final isNewGameProvider = Provider.autoDispose<bool>((ref) {
  final tictocstate = ref.watch(ticTacToePod);
  final intialState = ref.watch(initialTicTacStatePod);
  if (tictocstate == intialState) {
    return true;
  } else {
    return false;
  }
});
