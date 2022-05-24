import 'package:cloud_firestore/cloud_firestore.dart';

class Myth {
  final String id;
  final String title;
  final String subtitle;
  final String image;
  final String info;
  Myth(this.id, this.title, this.subtitle, this.image, this.info);

  // Myth.fromMap(Map<String, dynamic> data) {
  //   id = data['id'];
  //   title = data['title'];
  //   subtitle = data['subtitle'];
  //   image = data['image'];
  //   info = data['info'];
  // }
}
