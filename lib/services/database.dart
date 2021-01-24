import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService {
  final String uid;

  DatabaseService({ this.uid });

  // ignore: deprecated_member_use
  final CollectionReference studentInfo = Firestore.instance.collection(
      'users');

  Future<void> updateUserData(String groupvalue, String mailid) async {
    return await studentInfo.doc(uid).set({

      'groupvalue': groupvalue,
      'mailid': mailid,
    });
  }

  Stream<QuerySnapshot>get users{
    return studentInfo.snapshots();
  }
}