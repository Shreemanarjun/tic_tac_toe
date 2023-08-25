import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:tic_tac_toe/features/tic_tac_board/controller/tic_tac_toe_pod.dart';
import 'package:velocity_x/velocity_x.dart';

class ResetBtn extends ConsumerWidget {
  const ResetBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(ticTacToePod.notifier).resetGame();
      },
      child: "Reset"
          .text
          .xl2
          .bold
          .heightLoose
          .lime300
          .center
          .textStyle(GoogleFonts.getFont('Play'))
          .extraBold
          .makeCentered()
          .p12(),
    );
  }
}
