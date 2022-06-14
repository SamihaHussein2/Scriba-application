import 'package:cloud_firestore/cloud_firestore.dart';

class Myth {
  late String id;
  late String title;
  late String subtitle;
  late String image;
  late String info;
  Myth(this.id, this.title, this.subtitle, this.image, this.info);

  Myth.fromMap(Map<String, dynamic> data) {
    id = data['id'].toString();
    title = data['title'].toString();
    subtitle = data['subtitle'].toString();
    image = data['image'].toString();
    info = data['info'].toString();
  }
}
