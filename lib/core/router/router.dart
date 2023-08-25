import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: GameHomeMenu.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: TicTacToeBoardRoute.page,
      path: '/tic-tac-toe-board',
    ),
    AutoRoute(
      page: GameHistoryRoute.page,
      path: '/game-history',
    ),
    CustomRoute(
      page: SelectBoardSizeRoute.page,
      path: '/selectBoardSize',
      customRouteBuilder:
          <T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
        return DialogRoute(
          context: context,
          // this is important
          settings: page,
          builder: (_) => child,
        );
      },
    ),
    CustomRoute(
      page: MatchCompletionRoute.page,
      path: '/matchCompletion',
      customRouteBuilder:
          <T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
        return DialogRoute(
          barrierColor: Colors.transparent,
          context: context,
          // this is important
          settings: page,
          builder: (_) => child,
        );
      },
    ),
  ];
}
