import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scriba_app/api/firestore_conn.dart';
import 'package:scriba_app/models/myth.dart';
import 'package:scriba_app/services/myth_service.dart';

class MythRepo {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      fetchAllMyths() async {
    var snapshot = await getMyths(); //get documents inside the collection
    print(snapshot.docs.length);
    return snapshot.docs;
  }
}
