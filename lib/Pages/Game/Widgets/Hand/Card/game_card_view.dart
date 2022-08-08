import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Util/classes.dart';
import 'package:truco_of_legends/Pages/Game/Util/constants.dart';
import 'package:truco_of_legends/Pages/Game/Util/my_card.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/game_card_model.dart';

class GameCardView extends StatelessWidget {
  const GameCardView({
    super.key,
    required this.model,
  });

  final GameCardModel model;

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Stack(
        children: [
          GameCardBackground(
            image: '${model.region.name}/${model.name}',
            team: model.team,
          ),
          GameCardContent(
            attributes: model.atributtes,
            region: model.region,
          ),
        ],
      ),
    );
  }
}

class GameCardBackground extends StatelessWidget {
  const GameCardBackground({
    super.key,
    required this.image,
    required this.team,
  });

  final String image;
  final Team team;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: team.isPlayer ? Colors.blue : Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/images/cards/$image.png',
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class GameCardContent extends StatelessWidget {
  const GameCardContent({
    super.key,
    required this.attributes,
    required this.region,
  });

  final Attributes attributes;
  final Region region;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AttributesView(attributes: attributes),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RegionView(region: region),
            ],
          ),
        ],
      ),
    );
  }
}

class AttributesView extends StatelessWidget {
  const AttributesView({super.key, required this.attributes});

  final Attributes attributes;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AttributeText(text: attributes.values[Direction.top].toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AttributeText(text: attributes.values[Direction.left].toString()),
            const AttributeText(text: ' '),
            AttributeText(text: attributes.values[Direction.right].toString())
          ],
        ),
        AttributeText(text: attributes.values[Direction.bottom].toString())
      ],
    );
  }
}

class AttributeText extends StatelessWidget {
  const AttributeText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3.4
              ..color = Colors.black,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class RegionView extends StatelessWidget {
  const RegionView({super.key, required this.region});

  final Region region;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 3,
        right: 3,
      ),
      child: SizedBox(
        height: 24,
        width: 24,
        child: ClipOval(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 0.4,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/regions/${region.name}.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
