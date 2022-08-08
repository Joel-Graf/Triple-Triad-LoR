import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Util/Classes.dart';
import 'package:truco_of_legends/Pages/Game/Util/Constants.dart';
import 'package:truco_of_legends/Pages/Game/Util/MyCard.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/GameCardModel.dart';

class GameCardView extends StatelessWidget {
  const GameCardView({
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
        padding: EdgeInsets.all(4),
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
  const AttributesView({required this.attributes});

  final Attributes attributes;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AttributeText(attributes.values[Direction.TOP].toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AttributeText(attributes.values[Direction.LEFT].toString()),
            AttributeText(' '),
            AttributeText(attributes.values[Direction.RIGHT].toString())
          ],
        ),
        AttributeText(attributes.values[Direction.BOTTOM].toString())
      ],
    );
  }
}

class AttributeText extends StatelessWidget {
  const AttributeText(this.text);

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
          style: TextStyle(
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
  const RegionView({required this.region});

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
                  offset: Offset(0, 0),
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
