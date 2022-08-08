import 'package:truco_of_legends/Pages/Game/Util/Classes.dart';
import 'package:truco_of_legends/Pages/Game/Util/Constants.dart';

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
    this.team = this.team.isPlayer ? Team.ENEMY : Team.PLAYER;
  }
}
