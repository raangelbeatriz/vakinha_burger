import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/provider/application_bindings.dart';
import 'package:vakinha_burguer/app/pages/auth/login/login_page.dart';
import 'package:vakinha_burguer/app/pages/auth/register/register_page.dart';
import 'package:vakinha_burguer/app/pages/home/home_router.dart';
import 'package:vakinha_burguer/app/pages/product_details/product_details_router.dart';
import 'package:vakinha_burguer/app/pages/splash/splash_page.dart';

import 'core/routes/routes.dart';
import 'core/ui/theme/theme_config.dart';

class VakinhaBurguerApp extends StatelessWidget {
  const VakinhaBurguerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationBindings(
      child: MaterialApp(
        title: 'Vakinha Burguer',
        theme: ThemeConfig.theme,
        routes: {
          Routes.splashPage: (_) => const SplashPage(),
          Routes.home: (_) => HomeRouter.page,
          Routes.productDetails: (_) => ProductDetailsRouter.page,
          Routes.login: (_) => const LoginPage(),
          Routes.register: (_) => const RegisterPage()
        },
      ),
    );
  }
}
