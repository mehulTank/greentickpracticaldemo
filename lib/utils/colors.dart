import 'package:flutter/material.dart';

///created on 08/22/2021
///Purpose : common class for colors
class AppColor {
  static Color color243B77 = const Color(0xff243B77);
  //static Color colorBg = const Color(0xffE9E7E7);
  static Color colorBg = const Color(0xffFFFFFF);
  static Color color28A745 = const Color(0xff28A745);
  static Color colorFontColor = const Color(0xff68D4C1);
  static Color colorFontGrey = const Color(0xffc9c9c9);
  static Color colorBrown = const Color(0xffAB5653);


}

/// Created by Dev 2301 on 10/6/2021
/// Modified by Dev 2301 on 10/6/2021
/// Purpose : color palette for material color
/// this is used in primary swatch
/// primary swatch affects calendar dialog
class Palette {
  static const MaterialColor mainDark = const MaterialColor(
    0xff243B77, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff20356b), //10%
      100: const Color(0xff1d2f5f), //20%
      200: const Color(0xff192953), //30%
      300: const Color(0xff162347), //40%
      400: const Color(0xff121e3c), //50%
      500: const Color(0xff0e1830), //60%
      600: const Color(0xff0b1224), //70%
      700: const Color(0xff070c18), //80%
      800: const Color(0xff04060c), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
