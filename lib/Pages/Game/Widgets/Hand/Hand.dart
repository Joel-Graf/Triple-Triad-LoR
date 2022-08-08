import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/GameController.dart';
import 'package:truco_of_legends/Pages/Game/Providers/HandController.dart';
import 'package:truco_of_legends/Pages/Game/Util/Constants.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/HandEnemyView.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/HandModel.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/HandPlayerView.dart';
import 'package:provider/provider.dart';

class Hand extends StatelessWidget {
  const Hand({required this.team});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (context, gameController, child) => team.isPlayer
          ? Consumer<PlayerController>(
              builder: (context, playerController, child) => HandPlayerView(
                model: HandModel(
                  cards: playerController.cards,
                  team: team,
                  turn: gameController.turn,
                ),
              ),
            )
          : Consumer<EnemyController>(
              builder: (context, enemyController, child) => HandEnemyView(
                model: HandModel(
                  cards: enemyController.cards,
                  team: team,
                  turn: gameController.turn,
                ),
              ),
            ),
    );
  }
}
