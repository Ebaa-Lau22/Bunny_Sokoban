import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/algorithms_lab/structure/components.dart';
import 'package:untitled1/algorithms_lab/structure/game_model.dart';
import 'package:untitled1/algorithms_lab/structure/moves_logic.dart';
import '../logic/game_cubit.dart';
import '../logic/game_states.dart';

class PathScreen extends StatelessWidget {
  const PathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GameCubit.get(context);
        double side = MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text(
                  'EASTER SOKOBAN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
                onPressed: () => cubit.goBack(),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                width: side,
                height: side,
                color: Colors.brown,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: getRows(
                        context, side - 30, cubit.goalPath[cubit.pathIndex].currentState),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: cubit.goalPath[cubit.pathIndex].parentNode != null ? Text(
                                'Direction Taken: ${cubit.goalPath[cubit.pathIndex].directionTaken}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ) : const Text(
                                  'First Node',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                            ),
                      ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  children: [
                                    Text(
                                      'h: ${cubit.goalPath[cubit.pathIndex].cost - cubit.goalPath[cubit.pathIndex].depth + 1}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'g: ${cubit.goalPath[cubit.pathIndex].depth - 1}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 52,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: cubit.pathIndex != 0 ? () {
                                        cubit.updatePath(-1);
                                      } : null,
                                      child: const CircleAvatar(
                                        radius: 43.5,
                                        backgroundColor: Colors.brown,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.amber,
                                          child: Text(
                                            'Prev',
                                            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: cubit.pathIndex != cubit.goalPath.length-1 ? () {
                                        cubit.updatePath(1);
                                      } : null,
                                      child: const CircleAvatar(
                                        radius: 43.5,
                                        backgroundColor: Colors.brown,
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.amber,
                                          child: Text(
                                            'Next',
                                            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40,),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> getRows(context, double height, BoardState st) {
    List<Widget> board = [];
    for (int i = 0; i < LevelBasis.side; i++) {
      board.add(createRow(context, height, i, st));
    }
    return board;
  }

  Row createRow(context, double h, int rowIndex, BoardState st) {
    List<Widget> row = [];
    double cellSide = h / LevelBasis.side;
    for (int i = 0; i < LevelBasis.side; i++) {
      Position p = Position(rowIndex, i);
      if (Position.isEqual(p, st.bunnyPos)) {
        if (LevelBasis.board[rowIndex][i] == 'g') {
          row.add(Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  width: cellSide,
                  height: cellSide,
                  child: Image(
                    image: const AssetImage('assets/images/goal_cell.png'),
                    height: cellSide,
                    width: cellSide,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                  width: cellSide,
                  height: cellSide,
                  child: const Image(
                    image: AssetImage('assets/images/bunny.png'),
                    fit: BoxFit.contain,
                  )),
            ],
          ));
        } else {
          row.add(Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  width: cellSide,
                  height: cellSide,
                  child: Image(
                    image: const AssetImage('assets/images/dirt_road.jpg'),
                    height: cellSide,
                    width: cellSide,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                  width: cellSide,
                  height: cellSide,
                  child: const Image(
                    image: AssetImage('assets/images/bunny.png'),
                    fit: BoxFit.contain,
                  )),
            ],
          ));
        }
      } else if (Position.contains(st.eggsPos, p)) {
        if (LevelBasis.board[rowIndex][i] == 'g') {
          row.add(Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  width: cellSide,
                  height: cellSide,
                  child: Image(
                    image: const AssetImage('assets/images/goal_cell.png'),
                    height: cellSide,
                    width: cellSide,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                  width: cellSide * 0.75,
                  height: cellSide * 0.75,
                  child: const Image(
                    image: AssetImage('assets/images/yellow_easter.png'),
                    fit: BoxFit.contain,
                  )),
            ],
          ));
        } else {
          row.add(Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  width: cellSide,
                  height: cellSide,
                  child: Image(
                    image: const AssetImage('assets/images/dirt_road.jpg'),
                    height: cellSide,
                    width: cellSide,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                  width: cellSide * 0.75,
                  height: cellSide * 0.75,
                  child: const Image(
                    image: AssetImage('assets/images/red_easter.png'),
                    fit: BoxFit.contain,
                  )),
            ],
          ));
        }
      } else {
        AssetImage image;
        if (LevelBasis.board[rowIndex][i] == 'r') {
          image = const AssetImage('assets/images/dirt_road.jpg');
        } else if (LevelBasis.board[rowIndex][i] == 's') {
          image = const AssetImage('assets/images/stone_wall.png');
        } else {
          image = const AssetImage('assets/images/goal_cell.png');
        }
        row.add(SizedBox(
            width: cellSide,
            height: cellSide,
            child: Image(
              image: image,
              height: cellSide,
              width: cellSide,
              fit: BoxFit.cover,
            )));
      }
    }
    return Row(children: row);
  }
}
