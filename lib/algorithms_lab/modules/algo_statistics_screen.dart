import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/algorithms_lab/logic/game_cubit.dart';
import 'package:untitled1/algorithms_lab/logic/game_states.dart';
import 'package:untitled1/algorithms_lab/modules/home_screen.dart';
import 'package:untitled1/algorithms_lab/modules/path_screen.dart';
import 'package:untitled1/algorithms_lab/structure/components.dart';
import 'package:untitled1/algorithms_lab/structure/game_model.dart';

import 'game_screen.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GameCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text(
              'EASTER SOKOBAN',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            leading: IconButton(
              onPressed: () => navigateAndFinish(context, const HomeScreen()),
              icon: const Icon(Icons.arrow_back_outlined),
              color: Colors.brown,
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (cubit.gameStyle == 2)
                    const Text(
                      'DFS Algorithm',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  if (cubit.gameStyle == 3)
                    const Text(
                      'BFS Algorithm',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  if (cubit.gameStyle == 4)
                    const Text(
                      'UCS Algorithm',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  if (cubit.gameStyle == 5)
                    const Text(
                      'A-star Algorithm',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Nodes created: ${cubit.nodesCounter}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Max depth reached: ${cubit.algoMaxDepth}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Goal node depth: ${cubit.algoGoalNode.depth}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Goal node cost: ${cubit.algoGoalNode.cost}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Time of the algorithm: ${cubit.stopwatch.elapsed.inSeconds}.${cubit.stopwatch.elapsed.inMilliseconds}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Path taken: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 20,),
                      GestureDetector(
                          onTap: () {
                            navigateTo(context, const PathScreen());
                          },
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.forward,
                              color: Colors.brown,
                              size: 35,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
