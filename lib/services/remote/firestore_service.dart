import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  Future<List<Map>> getNotes() async {
    CollectionReference notesReference =
        FirebaseFirestore.instance.collection("notes");
    QuerySnapshot colletion = await notesReference.get();
    List<QueryDocumentSnapshot> docs =
        colletion.docs; //aqui los documentos son una colletion
    List<Map> notes = []; //aqui convertimos los documentos en una lista de mapa
    for (var item in docs) {
      Map note = item.data() as Map;
      notes.add(note);
    }
    return notes;
  }
}
