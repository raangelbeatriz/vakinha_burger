import 'package:flutter/material.dart';

import 'colors_app.dart';
import 'text_styles.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();
  static AppStyles get i {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      backgroundColor: ColorsApp.i.primary,
      textStyle: TextStyles.i.textButtonLabel);
}

extension AppStylesExtension on BuildContext {
  AppStyles get appStyles => AppStyles.i;
}
