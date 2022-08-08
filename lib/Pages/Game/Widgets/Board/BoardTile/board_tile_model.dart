import 'package:truco_of_legends/Pages/Game/Util/classes.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Hand/Card/game_card_model.dart';

class BoardTileModel {
  const BoardTileModel(this.point, {this.cardModel});

  final Point point;
  final GameCardModel? cardModel;

  bool get hasCard => cardModel != null;
  int get index => _getIndex(point);
  List<int> get neighboursIndexes =>
      [...point.neighbours.map((point) => _getIndex(point))];

  int _getIndex(Point point) => point.x + point.y * 4;
}
