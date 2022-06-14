import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('Users');
String? uid;

Future<String?> GetID(String? id) async {
  print(uid);
  return uid = id;
}

Future<void> AddUserInFirestore(String displayName, String email) async {
  users.doc(uid).set({
    'name': displayName,
    'id': uid,
    'email': email,
  });

  return;
}

Future<void> DeleteUserFromFirestore() async {
  users.doc(uid).delete();
  return;
}

Future<void> UpdateUser(String displayName, String email) async {
  users.doc(uid).update({'Full Name': displayName, 'email': email});
  return;
}
