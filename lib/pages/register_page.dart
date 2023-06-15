import 'package:codigo_states2/pages/cubit/counter/counter_cubit.dart';
import 'package:codigo_states2/pages/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterBloc registerBloc = RegisterBloc();

  @override
  void dispose() {
    super.dispose();
    registerBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Registro"),
      ),
      body: Column(
        children: [
          const TextField(),
          const SizedBox(
            height: 12.0,
          ),
          // StreamBuilder(
          //   stream: registerBloc.stream,
          //   builder: (BuildContext context, AsyncSnapshot snap) {
          //     if (snap.hasData) {
          //       return Text(
          //         snap.data.toString(),
          //         style: const TextStyle(
          //           fontSize: 40.0,
          //         ),
          //       );
          //     }
          //     return const Text(
          //       "0",
          //       style: TextStyle(
          //         fontSize: 40.0,
          //       ),
          //     );
          //   },
          // ),

          //BlocBuilder esta pendiente de los estados de  CounterCubit, que es un int (entero)
          BlocBuilder<CounterCubit, CounterState>(
              builder: (BuildContext context, CounterState state) {
            //print("wwww $state");
            return Text(
              state.toString(),
              style: const TextStyle(
                fontSize: 40,
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              //Aquì utilizò estoy utilizando el addCounter para incrementar
              // registerBloc.addCounter(IncrementEvent(1));

              context.read<CounterCubit>().increment();
            },
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}
