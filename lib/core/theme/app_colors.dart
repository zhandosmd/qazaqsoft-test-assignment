import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color mainColor = Color.fromRGBO(155, 81, 224, 1);
  static const Color gray = Color.fromRGBO(138, 138, 143, 1);

  static final MaterialColor customMaterialColor = MaterialColor(
    mainColor.value,
    <int, Color>{
      50: mainColor.withOpacity(0.1),
      100: mainColor.withOpacity(0.2),
      200: mainColor.withOpacity(0.3),
      300: mainColor.withOpacity(0.4),
      400: mainColor.withOpacity(0.5),
      500: mainColor.withOpacity(0.6),
      600: mainColor.withOpacity(0.7),
      700: mainColor.withOpacity(0.8),
      800: mainColor.withOpacity(0.9),
      900: mainColor.withOpacity(1.0),
    },
  );
}
