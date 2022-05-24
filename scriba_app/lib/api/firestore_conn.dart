import 'package:scriba_app/provider/myth_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getMyths() {
  var myths = FirebaseFirestore.instance.collection('Royals').orderBy('title');
  return myths.get();
}
