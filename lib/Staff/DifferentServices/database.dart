import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(
      String sID, String sName, String sDescription, String sPrice) async {
    try {
      await firestore.collection('services').add({
        'sID': sID,
        'sName': sName,
        'sDescription': sDescription,
        'sPrice': sPrice
      });
    } catch (e) {
      print(e);
    }
  }

  // Future<List> read() async {
  //   QuerySnapshot querySnapshot;
  //   List docs = [];
  //   try {
  //     querySnapshot = await firestore.collection('services').get();
  //     if (querySnapshot.docs.isNotEmpty) {
  //       for (var doc in querySnapshot.docs.toList()) {
  //         Map a = {
  //           "id": doc.id,
  //           "sID": doc['sID'],
  //           "sName": doc['sName'],
  //           "sDescription": doc['sDescription'],
  //           "sPrice": doc['sPrice']
  //         };
  //         docs.add(a);
  //       }
  //       return docs;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> update(String id, String sID, String sName, String sDescription,
      String sPrice) async {
    try {
      await firestore.collection('services').doc(id).update({
        'sID': sID,
        'sName': sName,
        'sDescription': sDescription,
        'sPrice': sPrice
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection('services').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
