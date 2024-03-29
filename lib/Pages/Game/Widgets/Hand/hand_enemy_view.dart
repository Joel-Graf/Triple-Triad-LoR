import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/game_card.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/hand_model.dart';

class HandEnemyView extends StatelessWidget {
  const HandEnemyView({super.key, required this.model});

  final HandModel model;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !model.isTurn,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/backgrounds/noxus-background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: model.cards
                          .map((cardModel) => Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: GameCard(model: cardModel),
                              ))
                          .toList(),
                    ),
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
