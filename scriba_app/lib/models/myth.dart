import 'package:cloud_firestore/cloud_firestore.dart';

class Myth {
  late String id;
  late String title;
  late String subtitle;
  late String image;
  late String info;
  Myth();

  Myth.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    subtitle = data['subtitle'];
    image = data['image'];
    info = data['info'];
  }
}
