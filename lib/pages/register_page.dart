import 'package:codigo_states2/pages/provider/example_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () {
                // exampleProvider.cambiarContador(10);

                //Aquì se agregar el boton con los cambios
                ExampleProvider exampleProvider =
                    Provider.of<ExampleProvider>(context, listen: false);
                exampleProvider.agregarContador();

                //segunda opciòn para ejecutar un tipo de acciòn
                // Provider.of<ExampleProvider>(context, listen: false)
                //    .agregarContador();

                //tercera opciòn para ejecutar un tipo de acciòn
                //context.read<ExampleProvider>().agregarContador();
              },
              child: const Text(
                "Register",
              ),
            ),
            // Text(
            //   context.watch<ExampleProvider>().contador.toString(),
            //),

            //En este còdigo oye los cambios y dibuja los wigets solicitados
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
          ],
        ),
      ),
    );
  }
}
