import 'moves_logic.dart';

class LevelBasis {
  static late int side;
  static late List<List<String>> board;
  static late Set<Position> goalCells;
  static late Set<Position> eggsFirstPos;
  static late Position bunnyFirstPos;
  static late Map<Set<Position>, int> distances;

  static void loadLvl(int lvl) {
    if (lvl == 1) {
      eggsFirstPos = {};
      side = 9;
      eggsFirstPos.add(Position(2, 2));
      eggsFirstPos.add(Position(3, 5));
      eggsFirstPos.add(Position(4, 3));
      bunnyFirstPos = Position(4, 4);
      board = [
        ['s', 's', 's', 's', 's', 's', 's', 's', 's'], // row0
        ['s', 'r', 'r', 'r', 's', 's', 's', 's', 's'], // row1
        ['s', 'r', 'r', 'r', 's', 'r', 'r', 'r', 's'], // row2
        ['s', 'r', 'r', 'r', 's', 'r', 's', 'r', 's'], // row3
        ['s', 's', 's', 'r', 'r', 'r', 'r', 'r', 's'], // row4
        ['s', 's', 'r', 'r', 'r', 's', 's', 's', 's'], // row5
        ['s', 's', 'r', 'r', 'g', 'g', 'g', 's', 's'], // row6
        ['s', 's', 's', 's', 's', 's', 's', 's', 's'], // row7
        ['s', 's', 's', 's', 's', 's', 's', 's', 's'], // row8
      ];
      goalCells = {Position(6, 4), Position(6, 5), Position(6, 6)};
    }
    else if (lvl == 2) {
      eggsFirstPos = {};
      side = 7;
      eggsFirstPos.add(Position(2, 3));
      eggsFirstPos.add(Position(3, 4));
      eggsFirstPos.add(Position(4, 3));
      eggsFirstPos.add(Position(4, 4));
      bunnyFirstPos = Position(3, 2);
      board = [
        ['s', 's', 's', 's', 's', 's', 's'], // row0
        ['s', 's', 'r', 's', 'r', 'g', 's'], // row1
        ['s', 's', 'r', 'r', 'r', 'g', 's'], // row2
        ['s', 's', 'r', 'r', 'r', 'g', 's'], // row3
        ['s', 's', 'r', 'r', 'r', 'g', 's'], // row4
        ['s', 's', 'r', 'r', 's', 's', 's'], // row5
        ['s', 's', 's', 's', 's', 's', 's'], // row6
      ];
      goalCells = {
        Position(1, 5),
        Position(2, 5),
        Position(3, 5),
        Position(4, 5)
      };
    }
    else if (lvl == 3) {
      eggsFirstPos = {};
      side = 7;
      eggsFirstPos.add(Position(2, 2));
      eggsFirstPos.add(Position(2, 4));
      eggsFirstPos.add(Position(3, 3));
      eggsFirstPos.add(Position(4, 2));
      eggsFirstPos.add(Position(4, 4));
      bunnyFirstPos = Position(5, 5);
      board = [
        ['s', 's', 's', 's', 's', 's', 's'], // row0
        ['s', 'r', 'r', 'g', 'r', 's', 's'], // row1
        ['s', 'r', 'r', 'r', 'r', 'r', 's'], // row2
        ['s', 'g', 'r', 'g', 'r', 'g', 's'], // row3
        ['s', 'r', 'r', 'r', 'r', 'r', 's'], // row4
        ['s', 's', 'r', 'g', 'r', 'r', 's'], // row5
        ['s', 's', 's', 's', 's', 's', 's'], // row6
      ];
      goalCells = {
        Position(1, 3),
        Position(3, 1),
        Position(3, 3),
        Position(3, 5),
        Position(5, 3)
      };
    }
    else if (lvl == 11) {
      side = 9;
      eggsFirstPos = {
        Position(2, 3),
        Position(2, 5),
        Position(2, 6),
        Position(3, 2),
        Position(5, 2)
      };

      goalCells = {
        Position(1, 3),
        Position(2, 6),
        Position(2, 7),
        Position(5, 2),
        Position(6, 4)
      };

      bunnyFirstPos = Position(6, 5);
      board = [
        ['s', 's', 's', 's', 's', 's', 's', 's', 's'], // row0
        ['s', 'r', 'r', 'g', 's', 'r', 'r', 'r', 's'], // row1
        ['s', 'r', 'r', 'r', 'r', 'r', 'g', 'g', 's'], // row2
        ['s', 'r', 'r', 's', 's', 'r', 's', 'r', 's'], // row3
        ['s', 'r', 'r', 'r', 's', 'r', 'r', 'r', 's'], // row4
        ['s', 'r', 'g', 'r', 's', 'r', 'r', 's', 's'], // row5
        ['s', 's', 'r', 'r', 'g', 'r', 's', 's', 's'], // row6
        ['s', 's', 's', 's', 's', 's', 's', 's', 's'], // row7
        ['s', 's', 's', 's', 's', 's', 's', 's', 's'], // row8
      ];
    }
    else if (lvl == 98) {
      side = 9;
      eggsFirstPos = {
        Position(2, 3),
        Position(2, 5),
        Position(3, 2),
        Position(3, 4),
        Position(3, 6),
        Position(4, 3),
        Position(4, 5),
        Position(5, 2),
        Position(5, 4),
        Position(5, 6),
        Position(6, 3),
        Position(6, 5),
      };

      goalCells = {
        Position(3, 2),
        Position(3, 3),
        Position(3, 4),
        Position(3, 5),
        Position(3, 6),
        Position(4, 2),
        Position(4, 6),
        Position(5, 2),
        Position(5, 3),
        Position(5, 4),
        Position(5, 5),
        Position(5, 6),
      };

      bunnyFirstPos = Position(7, 4);
      board = [
        ['s', 's', 's', 's', 's', 's', 's', 's', 's'], // row0
        ['s', 's', 's', 's', 's', 's', 'r', 'r', 's'], // row1
        ['s', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 's'], // row2
        ['s', 'r', 'g', 'g', 'g', 'g', 'g', 'r', 's'], // row3
        ['s', 'r', 'g', 'r', 'r', 'r', 'g', 'r', 's'], // row4
        ['s', 'r', 'g', 'g', 'g', 'g', 'g', 'r', 's'], // row5
        ['s', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 's'], // row6
        ['s', 's', 's', 'r', 'r', 'r', 's', 's', 's'], // row7
        ['s', 's', 's', 's', 's', 's', 's', 's', 's'], // row8
      ];
    }
    distances = <Set<Position>, int>{};
  }
}

class BoardState {
  late Position bunnyPos;
  late Set<Position> eggsPos;
  late List<String> availableDirections;

  BoardState({required Position bunnyPos, required Set<Position> eggsPos}) {
    this.eggsPos = {};
    this.bunnyPos = Position(bunnyPos.x, bunnyPos.y);
    for (Position p in eggsPos) {
      this.eggsPos.add(p);
    }
    availableDirections = checkAvailableMoves();
  }
  List<String> checkAvailableMoves() {
    List<String> finalList = [];
    if (MovesLogic.checkDirectionUp(
        bunnyPosition: bunnyPos, eggsPositions: eggsPos)) {
      finalList.add(Directions.up);
    }
    if (MovesLogic.checkDirectionDown(
        bunnyPosition: bunnyPos, eggsPositions: eggsPos)) {
      finalList.add(Directions.down);
    }
    if (MovesLogic.checkDirectionLeft(
        bunnyPosition: bunnyPos, eggsPositions: eggsPos)) {
      finalList.add(Directions.left);
    }
    if (MovesLogic.checkDirectionRight(
        bunnyPosition: bunnyPos, eggsPositions: eggsPos)) {
      finalList.add(Directions.right);
    }
    return finalList;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is BoardState) {
      bool sameEggsPos = true;
      for (Position p in other.eggsPos) {
        if (!Position.contains(eggsPos, p)) sameEggsPos = false;
      }
      return sameEggsPos && Position.isEqual(bunnyPos, other.bunnyPos);
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(bunnyPos, bunnyPos);
}

class Node {
  late BoardState currentState;
  Node? parentNode;
  String? directionTaken;
  late int cost;
  late int depth;
  int? heuristic;

  Node(
      {required this.currentState,
      this.parentNode,
      this.directionTaken,
      required this.cost,
      required this.depth});

  // this function returns the next node after moving in a specific direction
  // from the calling node
  Node move(String dir) {
    Position newBunnyPos;
    Set<Position> newEggsPos = {};
    if (dir == Directions.up) {
      int x = currentState.bunnyPos.x - 1;
      int y = currentState.bunnyPos.y;
      newBunnyPos = Position(x, y);
      for (Position oldEggPos in currentState.eggsPos) {
        if (Position.isEqual(oldEggPos, newBunnyPos)) {
          newEggsPos.add(Position(x - 1, y));
        } else {
          newEggsPos.add(oldEggPos);
        }
      }
    } else if (dir == Directions.down) {
      int x = currentState.bunnyPos.x + 1;
      int y = currentState.bunnyPos.y;
      newBunnyPos = Position(x, y);
      for (Position oldEggPos in currentState.eggsPos) {
        if (Position.isEqual(oldEggPos, newBunnyPos)) {
          newEggsPos.add(Position(x + 1, y));
        } else {
          newEggsPos.add(oldEggPos);
        }
      }
    } else if (dir == Directions.right) {
      int x = currentState.bunnyPos.x;
      int y = currentState.bunnyPos.y + 1;
      newBunnyPos = Position(x, y);
      for (Position oldEggPos in currentState.eggsPos) {
        if (Position.isEqual(oldEggPos, newBunnyPos)) {
          newEggsPos.add(Position(x, y + 1));
        } else {
          newEggsPos.add(oldEggPos);
        }
      }
    } else {
      int x = currentState.bunnyPos.x;
      int y = currentState.bunnyPos.y - 1;
      newBunnyPos = Position(x, y);
      for (Position oldEggPos in currentState.eggsPos) {
        if (Position.isEqual(oldEggPos, newBunnyPos)) {
          newEggsPos.add(Position(x, y - 1));
        } else {
          newEggsPos.add(oldEggPos);
        }
      }
    }
    return Node(
        cost: cost + 1,
        depth: depth + 1,
        parentNode: this,
        currentState: BoardState(bunnyPos: newBunnyPos, eggsPos: newEggsPos),
        directionTaken: dir);
  }

  static Node createFirstNode() {
    Set<Position> eggs = {};
    for (Position p in LevelBasis.eggsFirstPos) {
      eggs.add(p);
    }
    BoardState firstState = BoardState(
      bunnyPos:
          Position(LevelBasis.bunnyFirstPos.x, LevelBasis.bunnyFirstPos.y),
      eggsPos: eggs,
    );
    return Node(
        currentState: firstState,
        depth: 1,
        cost: 0,
        directionTaken: null,
        parentNode: null);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is Node) return currentState == other.currentState;
    return false;
  }

  @override
  int get hashCode => Object.hash(currentState, parentNode, cost);
}

class Position {
  late int x;
  late int y;

  Position(this.x, this.y);

  static bool isEqual(Position p1, Position p2) {
    if (p1.x == p2.x && p1.y == p2.y) return true;
    return false;
  }

  static bool contains(Set<Position> ps, Position p) {
    for (Position tmp in ps) {
      if (Position.isEqual(p, tmp)) return true;
    }
    return false;
  }

  @override
  bool operator ==(Object other) =>
      other is Position && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);

  bool operator >(Object other) {
    if (other is Position) {
      if (x == other.x) return y > other.y;
      return x > other.x;
    }
    return false;
  }

  @override
  String toString() => '($x, $y)';

  static int difference(Position p1, Position p2){
    int difference = 0;
    if(p1.x>p2.x) {
      difference += p1.x - p2.x;
    } else {
      difference += p2.x - p1.x;
    }
    if(p1.y>p2.y) {
      difference += p1.y - p2.y;
    } else {
      difference += p2.y - p1.y;
    }
    return difference;
  }
}

class Directions {
  static String up = "UP";
  static String down = "DOWN";
  static String right = "RIGHT";
  static String left = "LEFT";
}
