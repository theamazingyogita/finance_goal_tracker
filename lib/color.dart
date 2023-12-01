import 'dart:ui';

class ColorUtils {
  final primaryColor = HexColor("#2D2C79");
  final secondaryBlueColor = HexColor("#256CEA");
  final yellowColor = HexColor('#fac91e');
  final bottomSheetColor = HexColor('#F7F9FF');
  final tealColor = HexColor('##31DDC4');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
