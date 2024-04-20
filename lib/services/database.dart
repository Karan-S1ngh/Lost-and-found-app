import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addItems(Map<String, dynamic> itemMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Lost_Item_Add")
        .doc(id)
        .set(itemMap);
  }

  Future addFoundItem(Map<String, dynamic> itemMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Found_Item_Add")
        .doc(id)
        .set(itemMap);
  }

  Stream<QuerySnapshot> getItems() {
    return FirebaseFirestore.instance.collection("Lost_Item_Add").snapshots();
  }

  Stream<QuerySnapshot> getFoundItems() {
    return FirebaseFirestore.instance.collection("Found_Item_Add").snapshots();
  }
}
