import 'dart:collection';
import 'package:collection/collection.dart';
import 'game_model.dart';

class MovesLogic {

  static bool checkDirectionUp(
      {required Position bunnyPosition,
      required Set<Position> eggsPositions}) {
    int destX = bunnyPosition.x - 1; // the destination cell that the function check if the rabbit can go to
    int destY = bunnyPosition.y;
    if (LevelBasis.board[destX][destY] == 's') return false;
    if (destX > 0) {
      if (Position.contains(eggsPositions, Position(destX, destY)) &&
          Position.contains(eggsPositions, Position(destX - 1, destY))) {
        return false;
      }
      if (Position.contains(eggsPositions, Position(destX, destY)) &&
          LevelBasis.board[destX - 1][destY] == 's') {
        return false;
      }
    }
    return true;
  }

  static bool checkDirectionDown(
      {required Position bunnyPosition,
      required Set<Position> eggsPositions}) {
    int destX = bunnyPosition.x +
        1; // the destination cell that the function check if the rabbit can go to
    int destY = bunnyPosition.y;
    if (LevelBasis.board[destX][destY] == 's') return false;
    if (destX < LevelBasis.side) {
      if (Position.contains(eggsPositions, Position(destX, destY)) &&
          Position.contains(eggsPositions, Position(destX + 1, destY))) {
        return false;
      }
      if (Position.contains(eggsPositions, Position(destX, destY)) &&
          LevelBasis.board[destX + 1][destY] == 's') {
        return false;
      }
    }
    return true;
  }

  static bool checkDirectionRight(
      {required Position bunnyPosition,
      required Set<Position> eggsPositions}) {
    int destX = bunnyPosition
        .x; // the destination cell that the function check if the rabbit can go to
    int destY = bunnyPosition.y + 1;
    if (LevelBasis.board[destX][destY] == 's') return false;
    if (destY < LevelBasis.side) {
      if (Position.contains(eggsPositions, Position(destX, destY)) &&
          Position.contains(eggsPositions, Position(destX, destY + 1))) {
        return false;
      }
      if (Position.contains(eggsPositions, Position(destX, destY)) &&
          LevelBasis.board[destX][destY + 1] == 's') {
        return false;
      }
    }
    return true;
  }

  static bool checkDirectionLeft(
      {required Position bunnyPosition,
      required Set<Position> eggsPositions}) {
    int destX = bunnyPosition
        .x; // the destination cell that the function check if the rabbit can go to
    int destY = bunnyPosition.y - 1;
    if (LevelBasis.board[destX][destY] == 's') return false;
    if (destY > 0) {
      if (Position.contains(eggsPositions, Position(destX, destY)) &&
          Position.contains(eggsPositions, Position(destX, destY - 1))) {
        return false;
      }
      if (Position.contains(eggsPositions, Position(destX, destY)) &&
          LevelBasis.board[destX][destY - 1] == 's') {
        return false;
      }
    }
    return true;
  }

  static bool isFinal({required Set<Position> eggsPositions}) {

    if(eggsPositions.difference(LevelBasis.goalCells).isEmpty) return true;
    return false;
  }

  static bool isLoop({required BoardState st, required HashSet<BoardState> visited}){
    if(visited.contains(st)) return true;
    return false;
  }

  static bool isLoopNodes ({required Node n, required HashSet<Node> visitedNodes}){
    for(Node visited in visitedNodes){
      if(n.currentState == visited.currentState) return true;
    }
    return false;
  }

  static bool isInQueue ({required Node node, required PriorityQueue<Node> queue}){
    bool inQueue = false;
    Node? inQueueNode = queue.toList().firstWhereOrNull((element) => element.currentState == node.currentState);
    if(inQueueNode != null && node.depth < inQueueNode.depth ){
      inQueue = true;
      queue.remove(inQueueNode);
    }
    return inQueue;
  }

  static bool badState({required BoardState st}){
    int startColumn = 0;
    bool allWalls = true;
    while(allWalls){
      startColumn++;
      for(int i=0 ; i<LevelBasis.side ; i++){
        if(LevelBasis.board[i][startColumn] != 's') allWalls = false;
      }
    }

    int endColumn = LevelBasis.side-1;
    allWalls = true;
    while(allWalls){
      endColumn--;
      for(int i=0 ; i<LevelBasis.side ; i++){
        if(LevelBasis.board[i][endColumn] != 's') allWalls = false;
      }
    }

    int startRow = 0;
    allWalls = true;
    while(allWalls){
      startRow++;
      for(int i=0 ; i<LevelBasis.side ; i++){
        if(LevelBasis.board[startRow][i] != 's') allWalls = false;
      }
    }

    int endRow = LevelBasis.side-1;
    allWalls = true;
    while(allWalls){
      endRow--;
      for(int i=0 ; i<LevelBasis.side ; i++){
        if(LevelBasis.board[endRow][i] != 's') allWalls = false;
      }
    }

    int goals = 0;
    int eggs = 0;
    for(int i=0 ; i<LevelBasis.side ; i++){
      if(LevelBasis.board[startRow][i] == 'g') goals++;
      if(st.eggsPos.contains(Position(startRow, i))) eggs++;
    }
    if(eggs>goals) return true;

    goals = 0;
    eggs = 0;
    for(int i=0 ; i<LevelBasis.side ; i++){
      if(LevelBasis.board[endRow][i] == 'g') goals++;
      if(st.eggsPos.contains(Position(endRow, i))) eggs++;
    }
    if(eggs>goals) return true;

    goals = 0;
    eggs = 0;
    for(int i=0 ; i<LevelBasis.side ; i++){
      if(LevelBasis.board[i][startColumn] == 'g') goals++;
      if(st.eggsPos.contains(Position(i, startColumn))) eggs++;
    }
    if(eggs>goals) return true;

    goals = 0;
    eggs = 0;
    for(int i=0 ; i<LevelBasis.side ; i++){
      if(LevelBasis.board[i][endColumn] == 'g') goals++;
      if(st.eggsPos.contains(Position(i, endColumn))) eggs++;
    }
    if(eggs>goals) return true;

    for(Position eggPos in st.eggsPos){
      String rounds = '';
      if(LevelBasis.board[eggPos.x+1][eggPos.y] == 's') {
        rounds = '${rounds}d';
      }
      else if(LevelBasis.board[eggPos.x-1][eggPos.y] == 's') {
        rounds = '${rounds}u';
      }

      if(LevelBasis.board[eggPos.x][eggPos.y+1] == 's') {
        rounds = '${rounds}r';
      }
      else if(LevelBasis.board[eggPos.x][eggPos.y-1] == 's') {
        rounds = '${rounds}l';
      }

      if(rounds.isEmpty) continue;

      if(rounds.length > 1 && LevelBasis.board[eggPos.x][eggPos.y] != 'g') return true;
    }
    return false;
  }

  static int calculateHeuristic({required BoardState st}){

    if(MovesLogic.badState(st: st)) return 9999999;

    int heuristic = 0;
    Set<Position> eggsCopy = Set<Position>();
    Set<Position> goalsCopy = Set<Position>();
    for(Position p in st.eggsPos){
      eggsCopy.add(Position(p.x, p.y));
    }
    for(Position p in LevelBasis.goalCells){
      goalsCopy.add(Position(p.x, p.y));
    }

    eggsCopy = st.eggsPos.difference(LevelBasis.goalCells);
    goalsCopy = LevelBasis.goalCells.difference(st.eggsPos);
    Position currentPos = st.bunnyPos;

    while(eggsCopy.isNotEmpty){
      Position closestEgg = MovesLogic.getClosestGoal(eggPos: currentPos, goals: eggsCopy);
      heuristic += Position.difference(currentPos, closestEgg);
      currentPos = eggsCopy.first;
      Position closestGoal = MovesLogic.getClosestGoal(eggPos: currentPos, goals: goalsCopy);
      heuristic += Position.difference(currentPos, closestGoal);
      currentPos = closestGoal;
      eggsCopy.remove(eggsCopy.first);
      goalsCopy.remove(closestGoal);
    }

    return heuristic;
  }

  // this function takes an egg position and a set of goals position and return the closest goal to the egg in the set
  static Position getClosestGoal({required Position eggPos, required Set<Position> goals}){
    Position closestGoal = goals.first;
    int h = Position.difference(eggPos, goals.first);
    for(Position p in goals){
      int tmp = Position.difference(eggPos, p);
      if(tmp<h){
        closestGoal = p;
        h = tmp;
      }
    }
    return closestGoal;
  }

  static getPathBunnyToEgg(Position bunny, Position egg, Position goal){

  }

  /*static int getDistance(Position src, Position dest){
    Set<Position> pair = {src, dest};
    if(!LevelBasis.distances.containsKey(pair)){
      LevelBasis.distances[pair] = -1;
    }
    else{
      if(LevelBasis.distances[pair]! > 0) return LevelBasis.distances[pair]!;

    }
  }*/
}
