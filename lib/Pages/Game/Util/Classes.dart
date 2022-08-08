import 'package:flutter/cupertino.dart';
import 'package:truco_of_legends/Pages/Game/Util/Constants.dart';

class Point {
  const Point(this._x, this._y);

  final int _x;
  final int _y;

  get x => _x;
  get y => _y;

  List<Point> get neighbours {
    List<Point> neighbours = [];

    if (_isValidPoint(_y + 1)) {
      neighbours.add(Point(_x, _y + 1));
    }
    if (_isValidPoint(_x + 1)) {
      neighbours.add(Point(_x + 1, _y));
    }
    if (_isValidPoint(_y - 1)) {
      neighbours.add(Point(_x, _y - 1));
    }
    if (_isValidPoint(_x - 1)) {
      neighbours.add(Point(_x - 1, _y));
    }

    return neighbours;
  }

  bool _isValidPoint(int point) {
    return (point >= 0 && point < 4);
  }

  Direction getDirectionTo(Point relative) {
    final reference = this;

    if (reference.y < relative.y) {
      return Direction.TOP;
    } else if (reference.x < relative.x) {
      return Direction.RIGHT;
    } else if (reference.y > relative.y) {
      return Direction.BOTTOM;
    } else if (reference.x > relative.x) {
      return Direction.LEFT;
    }

    throw ErrorDescription(
        "ERROR: Class 'Point', Method 'getDirectionFrom' FAILED!");
  }
}

class Attributes {
  Attributes(this._top, this._right, this._bottom, this._left);

  int _top;
  int _right;
  int _bottom;
  int _left;

  Map<Direction, int> get values => {
        Direction.TOP: _top,
        Direction.RIGHT: _right,
        Direction.BOTTOM: _bottom,
        Direction.LEFT: _left
      };
}

class Powers {
  String name;
  String descrition;
  void Function() execution;

  Powers(this.name, this.descrition, this.execution);
}
