import 'package:cloud_firestore/cloud_firestore.dart';

class CampRepo {
  Future<QuerySnapshot> getPopularCampData() async {
    CollectionReference camps = FirebaseFirestore.instance.collection("camps");
    return camps.orderBy("view", descending: true).limit(10).get();
  }

  Future<QuerySnapshot> getSearchQuery() async {
    CollectionReference camps = FirebaseFirestore.instance.collection("camps");
    return camps.orderBy("title").get();
  }
}
