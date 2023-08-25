import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tic_tac_toe/features/tic_tac_board/model/tic_tac_model.dart';

class GameHistories {
  final List<GameHistoryModel> gameHistoies;
  GameHistories({
    required this.gameHistoies,
  });

  GameHistories copyWith({
    List<GameHistoryModel>? gameHistoies,
  }) {
    return GameHistories(
      gameHistoies: gameHistoies ?? this.gameHistoies,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gameHistoies': gameHistoies.map((x) => x.toMap()).toList(),
    };
  }

  factory GameHistories.fromMap(Map<String, dynamic> map) {
    return GameHistories(
      gameHistoies: List<GameHistoryModel>.from(
          map['gameHistoies']?.map((x) => GameHistoryModel.fromMap(x)) ??
              const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameHistories.fromJson(String source) =>
      GameHistories.fromMap(json.decode(source));

  @override
  String toString() => 'GameHistories(gameHistoies: $gameHistoies)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameHistories &&
        listEquals(other.gameHistoies, gameHistoies);
  }

  @override
  int get hashCode => gameHistoies.hashCode;
}

class GameHistoryModel {
  final DateTime dateTime;
  final TicTacToeState ticTacToeState;
  GameHistoryModel({
    required this.dateTime,
    required this.ticTacToeState,
  });

  GameHistoryModel copyWith({
    DateTime? dateTime,
    TicTacToeState? ticTacToeState,
  }) {
    return GameHistoryModel(
      dateTime: dateTime ?? this.dateTime,
      ticTacToeState: ticTacToeState ?? this.ticTacToeState,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime.millisecondsSinceEpoch,
      'ticTacToeState': ticTacToeState.toMap(),
    };
  }

  factory GameHistoryModel.fromMap(Map<String, dynamic> map) {
    return GameHistoryModel(
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      ticTacToeState: TicTacToeState.fromMap(map['ticTacToeState']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameHistoryModel.fromJson(String source) =>
      GameHistoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'GameHistoryModel(dateTime: $dateTime, ticTacToeState: $ticTacToeState)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameHistoryModel &&
        other.dateTime == dateTime &&
        other.ticTacToeState == ticTacToeState;
  }

  @override
  int get hashCode => dateTime.hashCode ^ ticTacToeState.hashCode;
}
