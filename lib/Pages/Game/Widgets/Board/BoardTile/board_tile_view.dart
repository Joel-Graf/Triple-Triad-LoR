import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/board_controller.dart';
import 'package:truco_of_legends/Pages/Game/Providers/game_controller.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Board/BoardTile/board_tile_model.dart';
import 'package:truco_of_legends/Pages/Game/Util/empety_tile.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/game_card_model.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/game_card_view.dart';
import 'package:provider/provider.dart';

class BoardTileView extends StatefulWidget {
  const BoardTileView({super.key, required this.model});

  final BoardTileModel model;

  @override
  BoardTileViewState createState() => BoardTileViewState();
}

class BoardTileViewState extends State<BoardTileView> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, List<Object?> candidateData, rejectedData) {
        return widget.model.hasCard
            ? GameCardView(model: widget.model.cardModel!)
            : const EmpetyTile();
      },
      onWillAccept: (data) {
        return !widget.model.hasCard;
      },
      onAccept: (GameCardModel model) {
        final newData = BoardTileModel(widget.model.point, cardModel: model);
        Provider.of<BoardController>(context, listen: false)
            .onCardPlay(newData);

        if (Provider.of<BoardController>(context, listen: false)
            .isBoardFull()) {
          Provider.of<GameController>(context, listen: false)
              .finishGame(model.team);
        } else {
          Provider.of<GameController>(context, listen: false).changeTurn();
        }
        notifyListeners();
      },
    );
  }
}
