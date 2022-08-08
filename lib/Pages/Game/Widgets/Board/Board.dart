import 'package:flutter/material.dart';
import 'package:truco_of_legends/Pages/Game/Providers/board_controller.dart';
import 'package:truco_of_legends/Pages/Game/Widgets/Board/BoardTile/board_tile_view.dart';
import 'package:provider/provider.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BoardController>(
      builder: (context, boardTilesController, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoardTileView(model: boardTilesController.boardTiles[12]),
              BoardTileView(model: boardTilesController.boardTiles[13]),
              BoardTileView(model: boardTilesController.boardTiles[14]),
              BoardTileView(model: boardTilesController.boardTiles[15]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoardTileView(model: boardTilesController.boardTiles[8]),
              BoardTileView(model: boardTilesController.boardTiles[9]),
              BoardTileView(model: boardTilesController.boardTiles[10]),
              BoardTileView(model: boardTilesController.boardTiles[11]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoardTileView(model: boardTilesController.boardTiles[4]),
              BoardTileView(model: boardTilesController.boardTiles[5]),
              BoardTileView(model: boardTilesController.boardTiles[6]),
              BoardTileView(model: boardTilesController.boardTiles[7]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoardTileView(model: boardTilesController.boardTiles[0]),
              BoardTileView(model: boardTilesController.boardTiles[1]),
              BoardTileView(model: boardTilesController.boardTiles[2]),
              BoardTileView(model: boardTilesController.boardTiles[3]),
            ],
          ),
        ],
      ),
    );
  }
}
