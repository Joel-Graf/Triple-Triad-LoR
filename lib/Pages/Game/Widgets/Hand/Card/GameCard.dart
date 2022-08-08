import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/hand_controller.dart';
import 'package:truco_of_legends/Pages/Game/Util/constants.dart';
import 'package:truco_of_legends/Pages/Game/Util/EmpetyTile.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/GameCardModel.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/GameCardView.dart';
import 'package:provider/provider.dart';

class GameCard extends StatefulWidget {
  const GameCard({this.model});

  final GameCardModel? model;

  bool get hasCard => model != null;

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> with ChangeNotifier {
  //FIXME: Erro: Não está chamando o Dispose ao trocar para tela de Finished
  @override
  Widget build(BuildContext context) {
    return widget.hasCard
        ? Draggable<GameCardModel>(
            child: GameCardView(
              model: widget.model!,
            ),
            feedback: Material(
              color: Colors.transparent,
              child: GameCardView(
                model: widget.model!,
              ),
            ),
            childWhenDragging: EmpetyTile(),
            data: widget.model!,
            onDragCompleted: () {
              widget.model!.team.isPlayer
                  ? Provider.of<PlayerController>(context, listen: false)
                      .remove(widget.model!)
                  : Provider.of<EnemyController>(context, listen: false)
                      .remove(widget.model!);
              notifyListeners();
            },
          )
        : EmpetyTile();
  }
}
