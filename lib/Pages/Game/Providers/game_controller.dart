import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Util/constants.dart';

class GameController with ChangeNotifier {
  Team _turn = Team.player;
  bool _isGameFinished = false;
  Team _winner = Team.player;

  Team get turn => _turn;
  bool get isGameFinished => _isGameFinished;
  Team get winner => _winner;

  void changeTurn() {
    _turn = _turn.isPlayer ? Team.enemy : Team.player;
    notifyListeners();
  }

  void finishGame(Team winner) {
    _isGameFinished = true;
    _winner = winner;
    notifyListeners();
  }
}
