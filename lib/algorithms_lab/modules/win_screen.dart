
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/algorithms_lab/logic/game_cubit.dart';
import 'package:untitled1/algorithms_lab/logic/game_states.dart';
import 'package:untitled1/algorithms_lab/structure/components.dart';
import 'home_screen.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({super.key});

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
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Text(
                    'YOU ARE NOT STUPID ^_^',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: ClipRRect(
                      borderRadius:
                      const BorderRadiusDirectional.all(
                          Radius.circular(20)),
                      child: defaultButton(
                        onPressed: () {
                          navigateAndFinish(context, const HomeScreen());
                        },
                        text: 'Home',
                        textColor: Colors.white,
                        buttonColor: Colors.amber,
                        borderRadius: 20,
                      ),
                    ),
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
