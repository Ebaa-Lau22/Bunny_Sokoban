import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/algorithms_lab/logic/game_cubit.dart';
import 'package:untitled1/algorithms_lab/logic/game_states.dart';
import 'package:untitled1/algorithms_lab/modules/game_screen.dart';
import 'package:untitled1/algorithms_lab/structure/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GameCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Easter Sokoban'),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Welcome To Easter Sokoban ^_^',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Choose how you want the game to be played:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: defaultButton(
                                  onPressed: () {
                                    cubit.gameStyle = 1;
                                    cubit.getLvlStarted();
                                    navigateTo(context, const GameScreen());
                                  },
                                  text: 'User Play',
                                  textColor: Colors.white,
                                  buttonColor: Colors.amber,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: SizedBox(
                                child: defaultButton(
                                  onPressed: () {
                                    cubit.gameStyle = 2;
                                    cubit.getLvlStarted();
                                    navigateTo(context, const GameScreen());
                                  },
                                  text: 'DFS',
                                  textColor: Colors.white,
                                  buttonColor: Colors.amber,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: defaultButton(
                                  onPressed: () {
                                    cubit.gameStyle = 3;
                                    cubit.getLvlStarted();
                                    navigateTo(context, const GameScreen());
                                  },
                                  text: 'BFS',
                                  textColor: Colors.white,
                                  buttonColor: Colors.amber,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: SizedBox(
                                child: defaultButton(
                                  onPressed: () {
                                    cubit.gameStyle = 4;
                                    cubit.getLvlStarted();
                                    navigateTo(context, const GameScreen());
                                  },
                                  text: 'UCS',
                                  textColor: Colors.white,
                                  buttonColor: Colors.amber,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 135,
                              child: defaultButton(
                                onPressed: () {
                                  cubit.gameStyle = 5;
                                  cubit.getLvlStarted();
                                  navigateTo(context, const GameScreen());
                                },
                                text: 'A-star',
                                textColor: Colors.white,
                                buttonColor: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          'Select the level: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    cubit.changeLevel(1);
                                  },
                                  child: cubit.level == 1 ? const CircleAvatar(
                                    radius: 21.5,
                                    backgroundColor: Colors.brown,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.amber,
                                      child: Text(
                                        '1',
                                        style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ) : CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.brown.shade400,
                                    child: const Text(
                                      '1',
                                      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    cubit.changeLevel(2);
                                  },
                                  child: cubit.level == 2 ? const CircleAvatar(
                                    radius: 21.5,
                                    backgroundColor: Colors.brown,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.amber,
                                      child: Text(
                                        '2',
                                        style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ) : CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.brown.shade400,
                                    child: const Text(
                                      '2',
                                      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    cubit.changeLevel(3);
                                  },
                                  child: cubit.level == 3 ? const CircleAvatar(
                                    radius: 21.5,
                                    backgroundColor: Colors.brown,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.amber,
                                      child: Text(
                                        '3',
                                        style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ) : CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.brown.shade400,
                                    child: const Text(
                                      '3',
                                      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    cubit.changeLevel(11);
                                  },
                                  child: cubit.level == 11 ? const CircleAvatar(
                                    radius: 21.5,
                                    backgroundColor: Colors.brown,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.amber,
                                      child: Text(
                                        '11',
                                        style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ) : CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.brown.shade400,
                                    child: const Text(
                                      '11',
                                      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    cubit.changeLevel(98);
                                  },
                                  child: cubit.level == 98 ? const CircleAvatar(
                                    radius: 21.5,
                                    backgroundColor: Colors.brown,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.amber,
                                      child: Text(
                                        '98',
                                        style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ) : CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.brown.shade400,
                                    child: const Text(
                                      '98',
                                      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/bunny.png'),)
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
