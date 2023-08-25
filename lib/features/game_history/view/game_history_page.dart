import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tic_tac_toe/features/game_history/controller/game_history_pod.dart';
import 'package:tic_tac_toe/features/game_menu/view/widget/text_option_btn.dart';
import 'package:tic_tac_toe/features/tic_tac_board/model/tic_tac_model.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class GameHistoryPage extends StatelessWidget {
  const GameHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "GAME HISTORY"
            .text
            .lime300
            .textStyle(GoogleFonts.getFont('Play'))
            .extraBold
            .make(),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final gamehistorydata = ref.watch(gameHistoryProvider);
          return gamehistorydata.gameHistoies.isEmpty
              ? const TextOptionBtn(
                  name: "No match played yet",
                )
              : ListView.separated(
                  itemCount: gamehistorydata.gameHistoies.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final currentGamehistory =
                        gamehistorydata.gameHistoies[index];
                    final status =
                        switch (currentGamehistory.ticTacToeState.matchStatus) {
                      MatchOwnType.BOT => "You Lost the match",
                      MatchOwnType.USER => "You won the match!!",
                      MatchOwnType.DRAW => "Match Draw",
                      _ => "",
                    };
                    return ListTile(
                      title: status.text.semiBold.heightLoose.lime300.make(),
                      subtitle: DateFormat.yMd()
                          .add_jm()
                          .format(currentGamehistory.dateTime)
                          .text
                          .make(),
                    );
                  },
                );
        },
      ).safeArea(),
    );
  }
}
