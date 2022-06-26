import 'package:scriba_app/defaults/config.dart';

//this class in responsible to check for the height and width of screens and return the suitable fontsize
// used in appbtn only
class FontSizeIntro extends SizeConfig {
  double width = SizeConfig.screenWidth;
  double height = SizeConfig.screenHeight;

  double checkSize() {
    if (width < 500) {
      return 20;
    } else {
      return 50;
    }
  }
}
