import 'package:cloud_firestore_platform_interface/src/timestamp.dart';

//the structure of how to Store Translations in Firestore  (as a map)

class Child {
  String? englishTranslation;
  Timestamp? createdIn;
  //String? arabicTranslation;

  Child({
    required this.createdIn,
    required this.englishTranslation,
  });

  Map<String, dynamic> toMap() {
    return {
      'english': englishTranslation,
      'created': createdIn,
    };
  }
}
