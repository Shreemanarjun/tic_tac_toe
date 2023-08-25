import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/router/router.gr.dart';
import 'package:tic_tac_toe/core/router/router_pod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/controller/tic_tac_toe_pod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/model/tic_tac_model.dart';
import 'package:velocity_x/velocity_x.dart';

class BoardTile extends ConsumerStatefulWidget {
  final int index;
  final int boardsize;
  const BoardTile(this.index, this.boardsize, {Key? key}) : super(key: key);

  @override
  ConsumerState<BoardTile> createState() => _BoardTileState();
}

class _BoardTileState extends ConsumerState<BoardTile> {
  @override
  Widget build(BuildContext context) {
    ref.listen(ticTacToePod, (previous, next) {
      if (next.isGameFinished && next.matchStatus != MatchOwnType.CONTINUING) {
        ref.read(autorouterProvider).navigate(const MatchCompletionRoute());
      }
    });
    final boardstate = ref.watch(ticTacToePod);
    final tileinfo = boardstate.board[widget.index];

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Vx.gray600,
        ),
      ),
      child: tileinfo.toString().text.xl4.extraBold.makeCentered(),
    ).onInkTap(boardstate.isGameFinished
        ? null
        : () {
            if (!ref.read(ticTacToePod).isGameFinished) {
              ref.read(ticTacToePod.notifier).makeMove(widget.index);
            }
          });
  }
}
