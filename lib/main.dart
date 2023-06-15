import 'package:codigo_states2/pages/cubit/counter/counter_cubit.dart';
import 'package:codigo_states2/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: const MaterialApp(
        title: "States App",
        home: HomePage(),
      ),
    );
  }
}
