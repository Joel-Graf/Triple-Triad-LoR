import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Util/my_card.dart';

class EmpetyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Container(
        color: Colors.purple[700]!,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
