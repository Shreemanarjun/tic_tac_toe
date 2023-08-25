import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:tic_tac_toe/features/tic_tac_board/controller/tic_tac_toe_pod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/model/tic_tac_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MatchStatusText extends ConsumerWidget {
  const MatchStatusText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchstatus = ref.watch(ticTacToePod).matchStatus;
    final status = switch (matchstatus) {
      MatchOwnType.BOT => "You Lost the match",
      MatchOwnType.USER => "You won the match!!",
      MatchOwnType.DRAW => "Match Draw",
      MatchOwnType.CONTINUING => "Dont lose hope",
    };
    return status.text.xl4.bold.heightLoose.cyan200.center
        .textStyle(GoogleFonts.getFont('Play'))
        .extraBold
        .isIntrinsic
        .makeCentered()
        .p12();
  }
}
