import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:tic_tac_toe/core/router/router_pod.dart';
import 'package:velocity_x/velocity_x.dart';

class GoBackBtn extends ConsumerWidget {
  const GoBackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(autorouterProvider).pop();
      },
      child: "Cancel"
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
