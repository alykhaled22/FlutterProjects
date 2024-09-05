import 'package:basketball_app/cubit/counter_cubit.dart';
import 'package:basketball_app/cubit/counter_state.dart';
import 'package:basketball_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Points Counter",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.orange,
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Team A",
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                          style: const TextStyle(
                            fontSize: 80,
                          ),
                        ),
                        CustomButton(
                          onPressd: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamAIncrement(1);
                          },
                          text: "Add 1 point",
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        CustomButton(
                          onPressd: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamAIncrement(2);
                          },
                          text: "Add 2 point",
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        CustomButton(
                          onPressd: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamAIncrement(3);
                          },
                          text: "Add 3 point",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 450,
                      child: VerticalDivider(
                        width: 5,
                        thickness: 0.2,
                        color: Colors.black,
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          "Team B",
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          "${BlocProvider.of<CounterCubit>(context).teamBPoints}",
                          style: const TextStyle(
                            fontSize: 80,
                          ),
                        ),
                        CustomButton(
                          onPressd: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamBIncrement(1);
                          },
                          text: "Add 1 point",
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        CustomButton(
                          onPressd: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamBIncrement(2);
                          },
                          text: "Add 2 point",
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        CustomButton(
                          onPressd: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamBIncrement(3);
                          },
                          text: "Add 3 point",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomButton(
                onPressd: () {
                  BlocProvider.of<CounterCubit>(context).resetCounter();
                },
                text: "Reset",
              ),
            ],
          ),
        );
      },
    );
  }
}
