import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Util/classes.dart';
import 'package:truco_of_legends/Pages/Game/Util/constants.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/game_card_model.dart';

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
      team: Team.player,
      region: Region.demacia,
      name: 'garen',
      rarity: Rarity.legendary,
      atributtes: Attributes(4, 1, 2, 1),
    ),
    GameCardModel(
      team: Team.player,
      region: Region.demacia,
      name: 'swiftwing_lancer',
      rarity: Rarity.common,
      atributtes: Attributes(0, -1, 7, 10),
    ),
    GameCardModel(
      team: Team.player,
      region: Region.demacia,
      name: 'laurent_duelist',
      rarity: Rarity.common,
      atributtes: Attributes(3, 4, 1, 2),
    ),
    GameCardModel(
      team: Team.player,
      region: Region.demacia,
      name: 'battlesmith',
      rarity: Rarity.common,
      atributtes: Attributes(4, 2, 0, 1),
    ),
    GameCardModel(
      team: Team.player,
      region: Region.demacia,
      name: 'mageseeker_inciter',
      rarity: Rarity.common,
      atributtes: Attributes(1, 0, 1, 3),
    ),
    GameCardModel(
      team: Team.player,
      region: Region.demacia,
      name: 'cithria_of_cloudfield',
      rarity: Rarity.common,
      atributtes: Attributes(10, 10, 10, 10),
    ),
    GameCardModel(
      team: Team.player,
      region: Region.demacia,
      name: 'plucky_poro',
      rarity: Rarity.common,
      atributtes: Attributes(-1, 10, 4, 2),
    ),
    GameCardModel(
      team: Team.player,
      region: Region.demacia,
      name: 'radiant_guardian',
      rarity: Rarity.common,
      atributtes: Attributes(1, 1, 1, 1),
    ),
  ],
);

final enemyController = EnemyController(
  cards: <GameCardModel?>[
    GameCardModel(
      team: Team.enemy,
      region: Region.noxus,
      name: 'darius',
      rarity: Rarity.legendary,
      atributtes: Attributes(3, 1, 2, 4),
    ),
    GameCardModel(
      team: Team.enemy,
      region: Region.noxus,
      name: 'affectionate_poro',
      rarity: Rarity.common,
      atributtes: Attributes(1, 4, 0, 7),
    ),
    GameCardModel(
      team: Team.enemy,
      region: Region.noxus,
      name: 'crimson_aristocrat',
      rarity: Rarity.common,
      atributtes: Attributes(5, 1, 2, -2),
    ),
    GameCardModel(
      team: Team.enemy,
      region: Region.noxus,
      name: 'arena_bookie',
      rarity: Rarity.common,
      atributtes: Attributes(6, 3, 1, 2),
    ),
    GameCardModel(
      team: Team.enemy,
      region: Region.noxus,
      name: 'legion_marauder',
      rarity: Rarity.common,
      atributtes: Attributes(4, 1, 3, 0),
    ),
    GameCardModel(
      team: Team.enemy,
      region: Region.noxus,
      name: 'legion_drummer',
      rarity: Rarity.common,
      atributtes: Attributes(0, 1, 2, 1),
    ),
    GameCardModel(
      team: Team.enemy,
      region: Region.noxus,
      name: 'shiraza_the_blade',
      rarity: Rarity.common,
      atributtes: Attributes(10, 10, 10, 10),
    ),
    GameCardModel(
      team: Team.enemy,
      region: Region.noxus,
      name: 'legion_veteran',
      rarity: Rarity.common,
      atributtes: Attributes(0, 5, 2, 10),
    ),
  ],
);
