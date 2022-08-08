enum Team { PLAYER, ENEMY }

extension TeamExt on Team {
  bool get isPlayer => this == Team.PLAYER;
}

enum Rarity { COMMON, RARE, EPIC, LEGENDARY }

enum Direction { TOP, RIGHT, BOTTOM, LEFT }

extension DirectionExt on Direction {
  Direction get opposite {
    switch (this) {
      case Direction.TOP:
        return Direction.BOTTOM;
      case Direction.RIGHT:
        return Direction.LEFT;
      case Direction.BOTTOM:
        return Direction.TOP;
      case Direction.LEFT:
        return Direction.RIGHT;
    }
  }
}

enum Region { DEMACIA, NOXUS }

extension RegionExt on Region {
  static const Map _names = {
    Region.DEMACIA: 'demacia',
    Region.NOXUS: 'noxus',
  };

  String get name => _names[this];
}
