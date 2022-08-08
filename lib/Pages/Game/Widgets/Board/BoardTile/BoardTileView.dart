import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/board_controller.dart';
import 'package:truco_of_legends/Pages/Game/Providers/game_controller.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Board/BoardTile/BoardTileModel.dart';
import 'package:truco_of_legends/Pages/Game/Util/EmpetyTile.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/GameCardModel.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/GameCardView.dart';
import 'package:provider/provider.dart';

class BoardTileView extends StatefulWidget {
  const BoardTileView({required this.model});

  final BoardTileModel model;

  @override
  _BoardTileViewState createState() => _BoardTileViewState();
}

class _BoardTileViewState extends State<BoardTileView> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, List<Object?> candidateData, rejectedData) {
        return widget.model.hasCard
            ? GameCardView(model: widget.model.cardModel!)
            : EmpetyTile();
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
              .finishGame(model.team); //FIXME: Definir corretamete o vencedor
        } else {
          Provider.of<GameController>(context, listen: false).changeTurn();
        }
        notifyListeners();
      },
    );
  }
}
