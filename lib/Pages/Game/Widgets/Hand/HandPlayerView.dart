import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/GameCard.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/HandModel.dart';

class HandPlayerView extends StatelessWidget {
  const HandPlayerView({required this.model});

  final HandModel model;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !model.isTurn,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/backgrounds/demacia-background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: model.cards
                        .map((cardModel) => GameCard(model: cardModel))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          if (!model.isTurn)
            Container(
              color: Colors.black.withOpacity(0.6),
            )
        ],
      ),
    );
  }
}
