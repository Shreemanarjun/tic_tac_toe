// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:tic_tac_toe/features/counter/view/counter_page.dart'
    deferred as _i1;
import 'package:tic_tac_toe/features/game_history/view/game_history_page.dart'
    deferred as _i2;
import 'package:tic_tac_toe/features/game_menu/view/game_menu_page.dart'
    deferred as _i3;
import 'package:tic_tac_toe/features/match_completion/view/match_completion_page.dart'
    deferred as _i4;
import 'package:tic_tac_toe/features/select_board_size/view/select_board_size_page.dart'
    deferred as _i5;
import 'package:tic_tac_toe/features/tic_tac_board/view/tic_tac_toe_board_page.dart'
    deferred as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.CounterPage(),
        ),
      );
    },
    GameHistoryRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.GameHistoryPage(),
        ),
      );
    },
    GameHomeMenu.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.GameHomeMenu(),
        ),
      );
    },
    MatchCompletionRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.MatchCompletionPage(),
        ),
      );
    },
    SelectBoardSizeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.SelectBoardSizePage(),
        ),
      );
    },
    TicTacToeBoardRoute.name: (routeData) {
      final args = routeData.argsAs<TicTacToeBoardRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.TicTacToeBoardPage(
            key: args.key,
            boardSize: args.boardSize,
          ),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i7.PageRouteInfo<void> {
  const CounterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GameHistoryPage]
class GameHistoryRoute extends _i7.PageRouteInfo<void> {
  const GameHistoryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          GameHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameHistoryRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GameHomeMenu]
class GameHomeMenu extends _i7.PageRouteInfo<void> {
  const GameHomeMenu({List<_i7.PageRouteInfo>? children})
      : super(
          GameHomeMenu.name,
          initialChildren: children,
        );

  static const String name = 'GameHomeMenu';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MatchCompletionPage]
class MatchCompletionRoute extends _i7.PageRouteInfo<void> {
  const MatchCompletionRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MatchCompletionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MatchCompletionRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SelectBoardSizePage]
class SelectBoardSizeRoute extends _i7.PageRouteInfo<void> {
  const SelectBoardSizeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SelectBoardSizeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectBoardSizeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TicTacToeBoardPage]
class TicTacToeBoardRoute extends _i7.PageRouteInfo<TicTacToeBoardRouteArgs> {
  TicTacToeBoardRoute({
    _i8.Key? key,
    required int boardSize,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          TicTacToeBoardRoute.name,
          args: TicTacToeBoardRouteArgs(
            key: key,
            boardSize: boardSize,
          ),
          initialChildren: children,
        );

  static const String name = 'TicTacToeBoardRoute';

  static const _i7.PageInfo<TicTacToeBoardRouteArgs> page =
      _i7.PageInfo<TicTacToeBoardRouteArgs>(name);
}

class TicTacToeBoardRouteArgs {
  const TicTacToeBoardRouteArgs({
    this.key,
    required this.boardSize,
  });

  final _i8.Key? key;

  final int boardSize;

  @override
  String toString() {
    return 'TicTacToeBoardRouteArgs{key: $key, boardSize: $boardSize}';
  }
}
