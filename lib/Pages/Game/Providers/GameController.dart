import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Util/Constants.dart';

class GameController with ChangeNotifier {
  Team _turn = Team.PLAYER;
  bool _isGameFinished = false;
  Team _winner = Team.PLAYER;

  Team get turn => _turn;
  bool get isGameFinished => _isGameFinished;
  Team get winner => _winner;

  void changeTurn() {
    _turn = _turn.isPlayer ? Team.ENEMY : Team.PLAYER;
    notifyListeners();
  }

  void finishGame(Team winner) {
    _isGameFinished = true;
    _winner = winner;
    notifyListeners();
  }
}
