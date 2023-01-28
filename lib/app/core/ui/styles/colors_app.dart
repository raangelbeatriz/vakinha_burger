import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color primary = const Color(0XFF007D21);
  Color secondary = const Color(0xFFF88B0C);
}

extension ColorAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
