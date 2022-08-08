import 'package:flutter/cupertino.dart';
import 'package:truco_of_legends/Pages/Game/Util/constants.dart';

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
      return Direction.top;
    } else if (reference.x < relative.x) {
      return Direction.right;
    } else if (reference.y > relative.y) {
      return Direction.bottom;
    } else if (reference.x > relative.x) {
      return Direction.left;
    }

    throw ErrorDescription(
        "ERROR: Class 'Point', Method 'getDirectionFrom' FAILED!");
  }
}

class Attributes {
  Attributes(this._top, this._right, this._bottom, this._left);

  final int _top;
  final int _right;
  final int _bottom;
  final int _left;

  Map<Direction, int> get values => {
        Direction.top: _top,
        Direction.right: _right,
        Direction.bottom: _bottom,
        Direction.left: _left
      };
}

class Powers {
  String name;
  String descrition;
  void Function() execution;

  Powers(this.name, this.descrition, this.execution);
}
