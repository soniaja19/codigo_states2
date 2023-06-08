import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  List<String> people = [];

  agregarPersona(String person) {
    people.add(person);
    notifyListeners();
  }
}
