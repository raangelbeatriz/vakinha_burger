import 'package:flutter/cupertino.dart';

extension SizeExtensions on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get heigth => MediaQuery.of(this).size.height;
}
