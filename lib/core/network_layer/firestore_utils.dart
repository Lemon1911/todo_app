import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/task_model.dart';

class FirestoreUtils {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection("TaskCollections")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromFirestore(snapshot.data()!),
          toFirestore: (value, _) => value.toFirestore(),
        );
  }

  static Future<void> addDataToFirestore(TaskModel model) {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Future<void> deleteDataFromFirestore(TaskModel model) {
    var collectionRef = getCollection();
    return collectionRef.doc(model.id).delete();
  }

  static Future<List<TaskModel>> getDataFromFirestore() async {
    var snapshot = await getCollection().get();

    return snapshot.docs.map((element) => element.data()).toList();
  }

  static Stream<QuerySnapshot<TaskModel>> getRealTimeDataFromFirestore(
      DateTime dateTime) {
    var snapshot = getCollection().snapshots();

    return snapshot;
  }
}
