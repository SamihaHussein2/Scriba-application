import 'package:scriba_app/models/myth.dart';
import 'package:scriba_app/repository/myth_repo.dart';

class MythService {
  final MythRepo _mythRepo = MythRepo();

  Future<List<Myth>> fetchMyth() async {
    var myths = await _mythRepo.fetchAllMyths();

    // to check if the connection with api(Backend) is working : approved
    // for (var snapshot in myths) {
    //   print(snapshot.data());
    // }

    return myths.map((snapshot) {
      var mythMap = snapshot.data();
      return Myth(
        mythMap['id'].toString(),
        mythMap['title'].toString(),
        mythMap['subtitle'].toString(),
        mythMap['image'].toString(),
        mythMap['info'].toString(),
      );
    }).toList();

    //return _mythRepo.fetchAllMyths();
  }
}
