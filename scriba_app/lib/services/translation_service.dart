import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scriba_app/models/translation.dart';
import 'package:scriba_app/services/user_service.dart';

late String translatedWord =
    "Lorem ipsum dolor sit amet. Aut molestiae consequuntur et praesentium quibusdam ad quis veritatis est dolorum.";

void getTranslation(String word) {
  translatedWord = word;
}

String displayTranslation() {
  return translatedWord;
}

//Funtion that add the translation in a new collection in the document of the user
//and store the english and the time when it's saved
Future<void> addTranslationToFirebase(
    String trans, Timestamp time, String id) async {
  print(id);

  var map = Child(englishTranslation: trans, createdIn: time).toMap();

  //update(map);
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(id)
      .collection("Translations")
      .doc()
      .set(map);
}
