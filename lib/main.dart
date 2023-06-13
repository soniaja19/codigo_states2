import 'package:codigo_states2/pages/home_page.dart';
import 'package:codigo_states2/pages/provider/notes_provider.dart';
import 'package:codigo_states2/pages/provider/post_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/provider/example_provider.dart';
import 'pages/provider/person_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider(create: (context) => NoteProvider()),
      ],
      child: MaterialApp(
        title: "Provider App",
        home: HomePage(),
      ),
    );
  }
}
