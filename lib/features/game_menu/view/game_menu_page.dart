import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:tic_tac_toe/core/router/router.gr.dart';
import 'package:tic_tac_toe/features/game_menu/view/widget/new_game_btn.dart';
import 'package:tic_tac_toe/features/game_menu/view/widget/text_option_btn.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class GameHomeMenu extends StatelessWidget {
  const GameHomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        "Tic-Tac-Toe"
            .text
            .xl5
            .extraBold
            .textStyle(GoogleFonts.getFont('Offside'))
            .makeCentered(),
        "Select your options"
            .text
            .xl2
            .semiBold
            .amber500
            .center
            .textStyle(GoogleFonts.getFont('Offside'))
            .makeCentered()
            .p12()
            .pOnly(bottom: 8, top: 60),
        const NewGameBtn(),
        TextOptionBtn(
          name: "HISTORY",
          onPressed: () {
            context.navigateTo(const GameHistoryRoute());
          },
        ),
        TextOptionBtn(
          name: "EXIT",
          onPressed: () async {
            if (Platform.isAndroid) {
              await SystemNavigator.pop();
            } else {
              exit(0);
            }
          },
        ),
      ]
          .vStack(
            alignment: MainAxisAlignment.center,
          )
          .pOnly(top: 150)
          .scrollVertical()
          .safeArea(),
    );
  }
}
