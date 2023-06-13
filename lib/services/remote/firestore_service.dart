import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  Future<List<Map>> getNotes() async {
    CollectionReference notesReference =
        FirebaseFirestore.instance.collection("notes");
    QuerySnapshot collection = await notesReference.get();
    List<QueryDocumentSnapshot> docs =
        collection.docs; //aqui los documentos son una colletion
    List<Map> notes = []; //aqui convertimos los documentos en una lista de mapa
    for (var item in docs) {
      Map note = item.data() as Map;
      note["id"] = item.id;
      notes.add(note);
    }
    return notes;
  }

  void updateNote(String id) {
    CollectionReference notesReferences =
        FirebaseFirestore.instance.collection("notes");
    notesReferences.doc(id).update(
      {
        "status": true,
      },
    );
  }
}
