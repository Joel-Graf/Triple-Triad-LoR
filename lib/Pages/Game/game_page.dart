import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/game_controller.dart';
import 'package:truco_of_legends/Pages/Game/Util/constants.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Board/board.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Finished/finished_view.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/hand.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Provider.of<GameController>(context, listen: true)
                  .isGameFinished
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: FinishedView(
                          Provider.of<GameController>(context, listen: false)
                              .winner),
                    ),
                  ],
                )
              : Column(
                  children: const <Widget>[
                    Expanded(
                      flex: 1,
                      child: Hand(team: Team.enemy),
                    ),
                    Expanded(
                      flex: 4,
                      child: Board(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Hand(team: Team.player),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
