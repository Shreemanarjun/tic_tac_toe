// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

enum MatchOwnType {
  BOT,
  USER,
  DRAW,
  CONTINUING,
}

class TicTacToeState {
  final List<String> board;
  final bool isPlayer1Turn;
  final bool isGameFinished;
  final MatchOwnType matchStatus;
  TicTacToeState({
    required this.board,
    required this.isPlayer1Turn,
    required this.isGameFinished,
    required this.matchStatus,
  });

  TicTacToeState copyWith({
    List<String>? board,
    bool? isPlayer1Turn,
    bool? isGameFinished,
    MatchOwnType? matchStatus,
  }) {
    return TicTacToeState(
      board: board ?? this.board,
      isPlayer1Turn: isPlayer1Turn ?? this.isPlayer1Turn,
      isGameFinished: isGameFinished ?? this.isGameFinished,
      matchStatus: matchStatus ?? this.matchStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'board': board,
      'isPlayer1Turn': isPlayer1Turn,
      'isGameFinished': isGameFinished,
      'matchStatus': _mapMatchOwnTypeToString(matchStatus),
    };
  }

  factory TicTacToeState.fromMap(Map<String, dynamic> map) {
    return TicTacToeState(
      board: List<String>.from(map['board'] ?? const []),
      isPlayer1Turn: map['isPlayer1Turn'] ?? false,
      isGameFinished: map['isGameFinished'] ?? false,
      matchStatus: _mapStringToMatchOwnType(map['matchStatus']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TicTacToeState.fromJson(String source) =>
      TicTacToeState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TicTacToeState(board: $board, isPlayer1Turn: $isPlayer1Turn, isGameFinished: $isGameFinished, matchStatus: $matchStatus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TicTacToeState &&
        listEquals(other.board, board) &&
        other.isPlayer1Turn == isPlayer1Turn &&
        other.isGameFinished == isGameFinished &&
        other.matchStatus == matchStatus;
  }

  @override
  int get hashCode {
    return board.hashCode ^
        isPlayer1Turn.hashCode ^
        isGameFinished.hashCode ^
        matchStatus.hashCode;
  }

  static String _mapMatchOwnTypeToString(MatchOwnType value) {
    switch (value) {
      case MatchOwnType.BOT:
        return 'BOT';
      case MatchOwnType.USER:
        return 'USER';
      case MatchOwnType.DRAW:
        return 'DRAW';
      case MatchOwnType.CONTINUING:
      default:
        return 'CONTINUING';
    }
  }

  static MatchOwnType _mapStringToMatchOwnType(String value) {
    switch (value) {
      case 'BOT':
        return MatchOwnType.BOT;
      case 'USER':
        return MatchOwnType.USER;
      case 'DRAW':
        return MatchOwnType.DRAW;
      case 'CONTINUING':
      default:
        return MatchOwnType.CONTINUING;
    }
  }
}
