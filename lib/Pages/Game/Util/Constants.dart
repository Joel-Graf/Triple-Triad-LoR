enum Team { player, enemy }

extension TeamExt on Team {
  bool get isPlayer => this == Team.player;
}

enum Rarity { common, rare, epic, legendary }

enum Direction { top, right, bottom, left }

extension DirectionExt on Direction {
  Direction get opposite {
    switch (this) {
      case Direction.top:
        return Direction.bottom;
      case Direction.right:
        return Direction.left;
      case Direction.bottom:
        return Direction.top;
      case Direction.left:
        return Direction.right;
    }
  }
}

enum Region { demacia, noxus }

extension RegionExt on Region {
  static const Map _names = {
    Region.demacia: 'demacia',
    Region.noxus: 'noxus',
  };

  String get name => _names[this];
}
