part of 'importutils.dart';

class Sizeconfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double tinggiLayar;
  static double lebarLayar;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    tinggiLayar = screenHeight / 100;
    lebarLayar = screenWidth / 100;
  }
}
