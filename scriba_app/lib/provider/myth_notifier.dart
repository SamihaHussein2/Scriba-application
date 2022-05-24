import 'dart:collection';
import 'package:scriba_app/services/myth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:scriba_app/models/myth.dart';

class MythNotifier extends ChangeNotifier {
  List<Myth> _mythList = [];
  List<Myth> get mythList => _mythList;
  final MythService _mythService = MythService();

  Future<void> fetchMyths() async {
    _mythList = await _mythService.fetchMyth();
    //print(_mythList.length);
    notifyListeners();
  }

  // UnmodifiableListView<Myth> get mythList => UnmodifiableListView(_mythList);

  // Myth get currentmMyth => _currentmMyth;

  // set mythList(List<Myth> mythList) {
  //   _mythList = mythList;
  //   notifyListeners();
  // }

  // set currentmMyth(Myth myth) {
  //   _currentmMyth = myth;
  // }

}
