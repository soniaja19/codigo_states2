import 'package:codigo_states2/services/remote/firestore_service.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  FireStoreService firestoreService = FireStoreService();

  List<Map> notes = [];

  getNotes() async {
    notes = await firestoreService.getNotes();
    notifyListeners();
  }

  updateNote(String id) {
    firestoreService.updateNote(id);
    getNotes();
  }
}
