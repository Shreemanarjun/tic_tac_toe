import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/router/router.gr.dart';
import 'package:tic_tac_toe/features/game_menu/controller/new_game_pod.dart';
import 'package:tic_tac_toe/features/game_menu/view/widget/text_option_btn.dart';
import 'package:tic_tac_toe/features/tic_tac_board/controller/tic_tac_toe_pod.dart';

class NewGameBtn extends ConsumerWidget {
  const NewGameBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNewGame = ref.watch(isNewGameProvider);
    return TextOptionBtn(
      name: isNewGame ? "NEW GAME" : "Resume Game",
      onPressed: () {
        isNewGame
            ? context.router.navigate(const SelectBoardSizeRoute())
            : context.router.navigate(
                TicTacToeBoardRoute(
                  boardSize: ref.read(defaultBoardSizePod),
                ),
              );
      },
    );
  }
}
