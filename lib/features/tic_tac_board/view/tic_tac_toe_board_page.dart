import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/view/widget/board_tile.dart';
import 'package:tic_tac_toe/features/tic_tac_board/view/widget/go_back_btn.dart';
import 'package:tic_tac_toe/features/tic_tac_board/view/widget/match_status_text.dart';
import 'package:tic_tac_toe/features/tic_tac_board/view/widget/reset_btn.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class TicTacToeBoardPage extends StatelessWidget {
  final int boardSize;
  const TicTacToeBoardPage({Key? key, required this.boardSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        body: <Widget>[
          const MatchStatusText(),
          GridView.builder(
            shrinkWrap: true,
            itemCount: boardSize,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: sqrt(boardSize).toInt(), childAspectRatio: 1.0),
            itemBuilder: (context, index) {
              return BoardTile(index, boardSize);
            },
          ),
          const ResetBtn().py12(),
          const GoBackBtn().py12(),
        ]
            .vStack()
            .pOnly(
              top: 100,
            )
            .p24()
            .scrollVertical(),
      ),
    );
  }
}
