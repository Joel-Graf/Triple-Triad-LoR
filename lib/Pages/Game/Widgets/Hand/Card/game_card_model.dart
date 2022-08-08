import 'package:truco_of_legends/Pages/Game/Util/classes.dart';
import 'package:truco_of_legends/Pages/Game/Util/constants.dart';

class GameCardModel {
  GameCardModel({
    required this.team,
    required this.region,
    required this.name,
    required this.rarity,
    required this.atributtes,
    this.powers,
  });

  Team team;
  final Region region;
  final String name;
  final Rarity rarity;
  Attributes atributtes;
  List<Powers>? powers;

  void flip() {
    team = team.isPlayer ? Team.enemy : Team.player;
  }
}
