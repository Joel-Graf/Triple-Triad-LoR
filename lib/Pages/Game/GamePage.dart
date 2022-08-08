import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/GameController.dart';
import 'package:truco_of_legends/Pages/Game/Util/Constants.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Board/Board.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Finished/FinishedView.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Hand.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
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
                  children: <Widget>[
                    const Expanded(
                      flex: 1,
                      child: Hand(team: Team.ENEMY),
                    ),
                    Expanded(
                      flex: 4,
                      child: Board(),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Hand(team: Team.PLAYER),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
