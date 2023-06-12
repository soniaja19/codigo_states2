import 'package:codigo_states2/pages/home_page.dart';
import 'package:codigo_states2/pages/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/provider/example_provider.dart';
import 'pages/provider/person_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Registrar a los providers usados en el App
        ChangeNotifierProvider(create: (context) => PersonProvider()),
        ChangeNotifierProvider(create: (context) => ExampleProvider()),
        ChangeNotifierProvider(create: (context) => PostProvider()),
      ],
      child: MaterialApp(
        title: "Provider App",
        home: HomePage(),
      ),
    );
  }
}
