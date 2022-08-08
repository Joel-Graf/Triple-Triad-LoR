import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Util/Classes.dart';
import 'package:truco_of_legends/Pages/Game/Util/Constants.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/GameCardModel.dart';

abstract class HandController with ChangeNotifier {
  HandController(this._cards);

  final List<GameCardModel?> _cards;

  List<GameCardModel?> get cards => _cards;

  void remove(GameCardModel card) {
    final index = _cards.indexOf(card);
    _cards[index] = null;
    notifyListeners();
  }
}

class PlayerController extends HandController {
  PlayerController({required List<GameCardModel?> cards}) : super(cards);
}

class EnemyController extends HandController {
  EnemyController({required List<GameCardModel?> cards}) : super(cards);
}

final playerController = PlayerController(
  cards: <GameCardModel?>[
    GameCardModel(
      team: Team.PLAYER,
      region: Region.DEMACIA,
      name: 'garen',
      rarity: Rarity.LEGENDARY,
      atributtes: Attributes(4, 1, 2, 1),
    ),
    GameCardModel(
      team: Team.PLAYER,
      region: Region.DEMACIA,
      name: 'swiftwing_lancer',
      rarity: Rarity.COMMON,
      atributtes: Attributes(0, -1, 7, 10),
    ),
    GameCardModel(
      team: Team.PLAYER,
      region: Region.DEMACIA,
      name: 'laurent_duelist',
      rarity: Rarity.COMMON,
      atributtes: Attributes(3, 4, 1, 2),
    ),
    GameCardModel(
      team: Team.PLAYER,
      region: Region.DEMACIA,
      name: 'battlesmith',
      rarity: Rarity.COMMON,
      atributtes: Attributes(4, 2, 0, 1),
    ),
    GameCardModel(
      team: Team.PLAYER,
      region: Region.DEMACIA,
      name: 'mageseeker_inciter',
      rarity: Rarity.COMMON,
      atributtes: Attributes(1, 0, 1, 3),
    ),
    GameCardModel(
      team: Team.PLAYER,
      region: Region.DEMACIA,
      name: 'cithria_of_cloudfield',
      rarity: Rarity.COMMON,
      atributtes: Attributes(10, 10, 10, 10),
    ),
    GameCardModel(
      team: Team.PLAYER,
      region: Region.DEMACIA,
      name: 'plucky_poro',
      rarity: Rarity.COMMON,
      atributtes: Attributes(-1, 10, 4, 2),
    ),
    GameCardModel(
      team: Team.PLAYER,
      region: Region.DEMACIA,
      name: 'radiant_guardian',
      rarity: Rarity.COMMON,
      atributtes: Attributes(1, 1, 1, 1),
    ),
  ],
);

final enemyController = EnemyController(
  cards: <GameCardModel?>[
    GameCardModel(
      team: Team.ENEMY,
      region: Region.NOXUS,
      name: 'darius',
      rarity: Rarity.LEGENDARY,
      atributtes: Attributes(3, 1, 2, 4),
    ),
    GameCardModel(
      team: Team.ENEMY,
      region: Region.NOXUS,
      name: 'affectionate_poro',
      rarity: Rarity.COMMON,
      atributtes: Attributes(1, 4, 0, 7),
    ),
    GameCardModel(
      team: Team.ENEMY,
      region: Region.NOXUS,
      name: 'crimson_aristocrat',
      rarity: Rarity.COMMON,
      atributtes: Attributes(5, 1, 2, -2),
    ),
    GameCardModel(
      team: Team.ENEMY,
      region: Region.NOXUS,
      name: 'arena_bookie',
      rarity: Rarity.COMMON,
      atributtes: Attributes(6, 3, 1, 2),
    ),
    GameCardModel(
      team: Team.ENEMY,
      region: Region.NOXUS,
      name: 'legion_marauder',
      rarity: Rarity.COMMON,
      atributtes: Attributes(4, 1, 3, 0),
    ),
    GameCardModel(
      team: Team.ENEMY,
      region: Region.NOXUS,
      name: 'legion_drummer',
      rarity: Rarity.COMMON,
      atributtes: Attributes(0, 1, 2, 1),
    ),
    GameCardModel(
      team: Team.ENEMY,
      region: Region.NOXUS,
      name: 'shiraza_the_blade',
      rarity: Rarity.COMMON,
      atributtes: Attributes(10, 10, 10, 10),
    ),
    GameCardModel(
      team: Team.ENEMY,
      region: Region.NOXUS,
      name: 'legion_veteran',
      rarity: Rarity.COMMON,
      atributtes: Attributes(0, 5, 2, 10),
    ),
  ],
);
