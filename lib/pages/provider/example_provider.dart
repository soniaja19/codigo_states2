import 'package:flutter/material.dart';

class ExampleProvider extends ChangeNotifier {
  int contador = 0;

//Estoy creando una funciòn para que reasigne al valor del contador
  cambiarContador(int valor) {
    contador = valor;
    notifyListeners(); // con ello notifica los cambios
  }

  agregarContador() {
    contador++;
    notifyListeners();
  }
}
