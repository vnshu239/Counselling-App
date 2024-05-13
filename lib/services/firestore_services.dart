import 'package:brainupp/const/const.dart';

class FirestoreServices {
  //get users data
  static getUser(uid) {
    return firestore
        .collection(userscollection)
        .where("id", isEqualTo: uid)
        .snapshots();
  }
}
