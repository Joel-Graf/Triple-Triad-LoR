import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/game_controller.dart';
import 'package:truco_of_legends/Pages/Game/Providers/hand_controller.dart';
import 'package:truco_of_legends/Pages/Game/Util/constants.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/hand_enemy_view.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/hand_model.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/hand_player_view.dart';
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
