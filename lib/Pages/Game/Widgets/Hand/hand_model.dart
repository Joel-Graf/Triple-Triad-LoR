import 'package:truco_of_legends/Pages/Game/Util/constants.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/game_card_model.dart';

class HandModel {
  const HandModel({
    required List<GameCardModel?> cards,
    required Team team,
    required Team turn,
  })  : _cards = cards,
        _team = team,
        _turn = turn;

  final List<GameCardModel?> _cards;
  final Team _team;
  final Team _turn;

  List<GameCardModel?> get cards => [..._cards];
  Team get team => _team;
  bool get isTurn => _team == _turn;
}
