import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/pages/splash/splash_page.dart';

import 'core/ui/theme/theme_config.dart';

class VakinhaBurguerApp extends StatelessWidget {
  const VakinhaBurguerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vakinha Burguer',
      theme: ThemeConfig.theme,
      routes: {'/': (context) => const SplashPage()},
    );
  }
}
