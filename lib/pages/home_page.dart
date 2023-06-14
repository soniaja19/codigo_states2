import 'package:codigo_states2/pages/register_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Listado de items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripciòn del item"),
          ),
          ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripciòn del item"),
          ),
        ],
      ),
    );
  }
}
