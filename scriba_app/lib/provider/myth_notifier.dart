import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:scriba_app/models/myth.dart';

class MythNotifier with ChangeNotifier {
  List<Myth> _mythList = [];
  late Myth _currentmMyth;

  UnmodifiableListView<Myth> get mythList => UnmodifiableListView(_mythList);

  Myth get currentmMyth => _currentmMyth;

  set mythList(List<Myth> mythList) {
    _mythList = mythList;
    notifyListeners();
  }

  set currentmMyth(Myth myth) {
    _currentmMyth = myth;
  }
}
