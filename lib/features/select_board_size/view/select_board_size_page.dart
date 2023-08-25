import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:tic_tac_toe/core/router/router.gr.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class SelectBoardSizePage extends StatelessWidget {
  const SelectBoardSizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: <Widget>[
        TextField(
          decoration: const InputDecoration(
            hintText: "",
            border: InputBorder.none,
            filled: false,
          ),
          controller: TextEditingController(
            text: '3X3',
          ),
          style: GoogleFonts.getFont('Play'),
        ),
      ].vStack(
        axisSize: MainAxisSize.min,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            context.replaceRoute(TicTacToeBoardRoute(boardSize: 9));
          },
          child: "OK"
              .text
              .xl2
              .bold
              .heightLoose
              .lime300
              .center
              .textStyle(GoogleFonts.getFont('Play'))
              .extraBold
              .isIntrinsic
              .makeCentered()
              .p12(),
        )
      ],
    );
  }
}
