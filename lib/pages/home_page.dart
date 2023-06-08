import 'package:codigo_states2/pages/provider/example_provider.dart';
import 'package:codigo_states2/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Se utiliza para crear Provider, la màs utilizada
    //el listen: false es para que no notifique a la pantalla home page no este oyendo el cambio
    ExampleProvider exampleProvider =
        Provider.of<ExampleProvider>(context, listen: false);

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
        children: [
          const ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripciòn del item"),
          ),
          const ListTile(
            title: Text("Nombre del item"),
            subtitle: Text("Descripciòn del item"),
          ),
          Consumer<ExampleProvider>(
            builder: (context, provider, _) {
              return Text(
                provider.contador.toString(),
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              );
            },
          ),

          //Primera opcion
          // Text(
          //   context.watch<ExampleProvider>().contador.toString(),
          //),
        ],
      ),
    );
  }
}
