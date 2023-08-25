import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/features/game_history/controller/notifier/game_history_notifier.dart';
import 'package:tic_tac_toe/features/game_history/model/game_history_model.dart';

final gameHistoryProvider =
    NotifierProvider.autoDispose<GameHistoryListNotifier, GameHistories>(
        GameHistoryListNotifier.new);
