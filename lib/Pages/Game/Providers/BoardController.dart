import 'package:flutter/cupertino.dart';
import 'package:truco_of_legends/Pages/Game/Util/Classes.dart';
import 'package:truco_of_legends/Pages/Game/Util/Constants.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Board/BoardTile/BoardTileModel.dart';

class BoardController with ChangeNotifier {
  final List<BoardTileModel> _boardTiles = [
    const BoardTileModel(Point(0, 0)), // 0
    const BoardTileModel(Point(1, 0)), // 1
    const BoardTileModel(Point(2, 0)), // 2
    const BoardTileModel(Point(3, 0)), // 3
    const BoardTileModel(Point(0, 1)), // 4
    const BoardTileModel(Point(1, 1)), // 5
    const BoardTileModel(Point(2, 1)), // 6
    const BoardTileModel(Point(3, 1)), // 7
    const BoardTileModel(Point(0, 2)), // 8
    const BoardTileModel(Point(1, 2)), // 9
    const BoardTileModel(Point(2, 2)), // 10
    const BoardTileModel(Point(3, 2)), // 11
    const BoardTileModel(Point(0, 3)), // 12
    const BoardTileModel(Point(1, 3)), // 13
    const BoardTileModel(Point(2, 3)), // 14
    const BoardTileModel(Point(3, 3)), // 15
  ];

  List<BoardTileModel> get boardTiles => [..._boardTiles];

  bool isBoardFull() {
    bool isBoardFull = true;
    for (var boardTileModel in _boardTiles) {
      if (!boardTileModel.hasCard) {
        isBoardFull = false;
        break;
      }
    }
    return isBoardFull;
  }

  int calculatePlayerScore() {
    int score = 0;
    if (isBoardFull()) {
      for (var boardTileModel in _boardTiles) {
        if (boardTileModel.cardModel!.team.isPlayer) {
          score++;
        }
      }
    }
    return score;
  }

  void onCardPlay(BoardTileModel played) {
    _updateBoardTile(played);
    _tryToFlipNeighbours(played);
    notifyListeners();
  }

  void _updateBoardTile(BoardTileModel data) {
    _boardTiles[data.index] = data;
  }

  void _tryToFlipNeighbours(BoardTileModel played) {
    final List<BoardTileModel> neighbours = _getNeighbours(played);
    for (var neighbour in neighbours) {
      if (neighbour.hasCard && _isFlippable(played, neighbour)) {
        _flip(neighbour);
      }
    }
  }

  List<BoardTileModel> _getNeighbours(BoardTileModel model) {
    final List<int> indexes = model.neighboursIndexes;
    return [...indexes.map((index) => _boardTiles[index])];
  }

  bool _isFlippable(BoardTileModel played, BoardTileModel neighbour) {
    return _isOppositeTeam(played, neighbour) &&
        _hasHigherAttributes(played, neighbour);
  }

  void _flip(BoardTileModel model) {
    model.cardModel!.flip();
    _updateBoardTile(model);
  }

  bool _isOppositeTeam(BoardTileModel played, BoardTileModel neighbour) {
    return played.cardModel!.team != neighbour.cardModel!.team;
  }

  bool _hasHigherAttributes(BoardTileModel played, BoardTileModel neighbour) {
    final Direction attackDirection =
        played.point.getDirectionTo(neighbour.point);
    final int attackValue =
        played.cardModel!.atributtes.values[attackDirection]!;

    final Direction deffenseDirection = attackDirection.opposite;
    final int deffenseValue =
        neighbour.cardModel!.atributtes.values[deffenseDirection]!;

    return attackValue > deffenseValue;
  }
}
