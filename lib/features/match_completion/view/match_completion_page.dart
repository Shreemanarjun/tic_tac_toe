import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:tic_tac_toe/core/router/router.gr.dart';
import 'package:tic_tac_toe/core/router/router_pod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/controller/tic_tac_toe_pod.dart';
import 'package:tic_tac_toe/features/tic_tac_board/view/widget/match_status_text.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class MatchCompletionPage extends StatelessWidget {
  const MatchCompletionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        content: <Widget>[const MatchStatusText()].vStack(
          axisSize: MainAxisSize.min,
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  ref.read(autorouterProvider).back();
                  ref.invalidate(ticTacToePod);
                },
                child: "Start a new match"
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
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  ref
                      .read(autorouterProvider)
                      .replaceAll([const GameHomeMenu()]);
                  ref.invalidate(ticTacToePod);
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
                    .isIntrinsic
                    .makeCentered()
                    .p12(),
              );
            },
          ).py8()
        ],
      ),
    );
  }
}
