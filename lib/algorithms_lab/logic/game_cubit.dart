import 'dart:collection';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/algorithms_lab/modules/algo_statistics_screen.dart';
import 'package:untitled1/algorithms_lab/structure/components.dart';
import 'package:untitled1/algorithms_lab/structure/game_model.dart';
import 'package:untitled1/algorithms_lab/structure/moves_logic.dart';
import 'package:collection/collection.dart';
import '../modules/win_screen.dart';
import 'game_states.dart';

class GameCubit extends Cubit<GameStates> {
  GameCubit() : super(InitialGameState());

  static GameCubit get(context) => BlocProvider.of(context);

  // 1: userPlayer, 2: DFS, 3: BFS, 4: UCS, 5: A-star
  int gameStyle = 1;
  int level = 1;
  late Node currentNode;
  int pathIndex = 0;

  MyStack<Node> tempPath = MyStack<Node>();
  List<Node> goalPath = <Node>[];
  int pathCounter = 0;
  int nodesCounter = 0;
  HashSet<BoardState> visited = HashSet<BoardState>();
  HashSet<Node> visitedNodes = HashSet<Node>();
  bool algoFinished = false;
  late Node algoGoalNode;
  int algoMaxDepth = 1;

  final stopwatch = Stopwatch();

  Queue<Node> frontiersBFS = Queue<Node>();

  PriorityQueue<Node> frontiersUCS = PriorityQueue<Node>((p0, p1) => p0.cost.compareTo(p1.cost));

  PriorityQueue<Node> frontiersAStar = PriorityQueue<Node>( (p0, p1) {
    if(p0.cost.compareTo(p1.cost) == 0) return p1.depth.compareTo(p0.depth);
    return p0.cost.compareTo(p1.cost);
  });

  void changeLevel(int lvl) {
    level = lvl;
    emit(ChangeLevelState());
  }

  void getLvlStarted() {
    LevelBasis.loadLvl(level);
    currentNode = Node.createFirstNode();
    goalPath.clear();
    pathCounter = 0;
    nodesCounter = 0;
    visited.clear();
    visitedNodes.clear();
    algoFinished = false;
    algoMaxDepth = 1;
    frontiersUCS.clear();
    frontiersAStar.clear();
    frontiersBFS.clear();
    pathIndex = 0;
    emit(ShowState());
  }

  bool levelWon = false;

  void getNextNode(context, String dir) {
    if (currentNode.currentState.availableDirections.contains(dir)) {
      currentNode = currentNode.move(dir);
      emit(BunnyMovedState());

      if (MovesLogic.isFinal(eggsPositions: currentNode.currentState.eggsPos)) {
        navigateAndFinish(context, const WinScreen());
      }
    }
  }

  void goBack() {
    if (currentNode.parentNode != null) {
      currentNode = currentNode.parentNode!;
      emit(BunnyMovedState());
    }
  }

  int l = 0;
  void startDFS(context, Node n) {
    print(nodesCounter);
    if (algoFinished) return;

    algoMaxDepth = max(algoMaxDepth, n.depth);

    if (MovesLogic.isFinal(eggsPositions: n.currentState.eggsPos)) {
      algoFinished = true;
      algoGoalNode = n;
      getGoalNodeBath(n);
      stopwatch.stop();
      navigateAndFinish(context, const StatisticsScreen());
    }

    /*if (MovesLogic.badState(st: n.currentState)) {
      print('bad State');
      return;
    }*/

    nodesCounter++;

    for (String dir in n.currentState.availableDirections) {
      Node child = n.move(dir);
      if(MovesLogic.isLoop(st: child.currentState, visited: visited)) continue;
      visited.add(child.currentState);
      startDFS(context, child);
    }
  }

  void startBFS(context) {

    if (MovesLogic.isFinal(eggsPositions: currentNode.currentState.eggsPos)) {
      algoGoalNode = currentNode;
      getGoalNodeBath(currentNode);
      navigateAndFinish(context, const StatisticsScreen());
      return;
    }
    visited.add(currentNode.currentState);
    nodesCounter++;
    for (String dir in currentNode.currentState.availableDirections) {
      Node tmp = currentNode.move(dir);
      if (MovesLogic.isFinal(eggsPositions: tmp.currentState.eggsPos)) {
        algoGoalNode = tmp;
        getGoalNodeBath(tmp);
        navigateAndFinish(context, const StatisticsScreen());
        return;
      }
      frontiersBFS.add(tmp);
    }
    while (frontiersBFS.isNotEmpty) {
      Node n = frontiersBFS.removeFirst();
      utilBFS(context, n);
    }
  }

  void utilBFS(context, Node n) {
    if (algoFinished) return;

    /*if (MovesLogic.badState(st: n.currentState)) {
      print('bad State');
      return;
    }*/

    nodesCounter++;

    for (String dir in n.currentState.availableDirections) {
      Node child = n.move(dir);

      if (!MovesLogic.isLoop(st: child.currentState, visited: visited)) {
        visited.add(child.currentState);
      } else {
        continue;
      }

      algoMaxDepth = max(algoMaxDepth, child.depth);

      if (MovesLogic.isFinal(eggsPositions: child.currentState.eggsPos)) {
        algoFinished = true;
        algoGoalNode = child;
        getGoalNodeBath(child);
        stopwatch.stop();
        navigateAndFinish(context, const StatisticsScreen());
        return;
      }

      frontiersBFS.add(child);
    }
  }

  void startUCS(context, Node firstNode){
    if(MovesLogic.isFinal(eggsPositions: firstNode.currentState.eggsPos)){
      algoGoalNode = currentNode;
      getGoalNodeBath(currentNode);
      stopwatch.stop();
      navigateAndFinish(context, const StatisticsScreen());
      return;
    }

    //visited.add(firstNode.currentState);
    visitedNodes.add(firstNode);
    nodesCounter++;

    for(String dir in firstNode.currentState.availableDirections){
      Node tmp = firstNode.move(dir);
      frontiersUCS.add(tmp);
    }

    while(frontiersUCS.isNotEmpty){
      Node node = frontiersUCS.removeFirst();

      algoMaxDepth = max(algoMaxDepth, node.depth);

      if(MovesLogic.isFinal(eggsPositions: node.currentState.eggsPos)){
        algoGoalNode = node;
        getGoalNodeBath(node);
        stopwatch.stop();
        navigateAndFinish(context, const StatisticsScreen());
        return;
      }

      nodesCounter++;
      print(nodesCounter);
      for(String dir in node.currentState.availableDirections){
        Node child = node.move(dir);
        if(!MovesLogic.isLoop(st: child.currentState, visited: visited)){
          frontiersUCS.add(child);
          visited.add(child.currentState);
        }
        else if(MovesLogic.isInQueue(node: child, queue: frontiersUCS)){
          frontiersUCS.add(child);
        }
      }
    }

  }

  void startAStar(context, Node firstNode){

    int h = MovesLogic.calculateHeuristic(st: firstNode.currentState);
    firstNode.cost = h;

    if(h == 0){
      algoGoalNode = currentNode;
      getGoalNodeBath(currentNode);
      stopwatch.stop();
      navigateAndFinish(context, const StatisticsScreen());
      return;
    }

    visited.add(firstNode.currentState);
    nodesCounter++;

    for(String dir in firstNode.currentState.availableDirections){
      Node tmp = firstNode.move(dir);
      int heu = MovesLogic.calculateHeuristic(st: tmp.currentState);
      tmp.cost = heu + tmp.depth - 1;
      frontiersAStar.add(tmp);
    }

    while(frontiersAStar.isNotEmpty){
      Node node = frontiersAStar.removeFirst();

      algoMaxDepth = max(algoMaxDepth, node.depth);

      int heuristic = MovesLogic.calculateHeuristic(st: node.currentState);
      node.cost = heuristic + node.depth - 1;

      if(heuristic == 0){
        algoGoalNode = node;
        getGoalNodeBath(node);
        stopwatch.stop();
        navigateAndFinish(context, const StatisticsScreen());
        return;
      }

      nodesCounter++;

      for(String dir in node.currentState.availableDirections){
        Node child = node.move(dir);
        /*if(MovesLogic.isLoop(st: child.currentState, visited: visited)) continue;
        visited.add(child.currentState);
        frontiersAStar.add(child);*/
        if(!MovesLogic.isLoop(st: child.currentState, visited: visited)){
          frontiersAStar.add(child);
          visited.add(child.currentState);
        }
        else if(MovesLogic.isInQueue(node: child, queue: frontiersAStar)){
          frontiersAStar.add(child);
        }
      }
    }
  }

  void getGoalNodeBath(Node? n) {
    while (n != null) {
      tempPath.push(n);
      pathCounter++;
      n = n.parentNode;
    }
    while(tempPath.isNotEmpty){
      goalPath.add(tempPath.pop());
    }
  }

  void updatePath(int x){
    if(x>0) {
      pathIndex++;
    } else {
      pathIndex--;
    }

    emit(BunnyMovedState());
  }
}
