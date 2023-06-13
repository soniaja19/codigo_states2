import 'package:codigo_states2/services/remote/firestore_service.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  FireStoreService fireStoreService = FireStoreService();

  List<Map> notes = [];
  getNotes() async {
    notes = await fireStoreService.getNotes();
    notifyListeners();
  }
}
