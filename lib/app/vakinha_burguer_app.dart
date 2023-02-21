import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/global/global_context.dart';
import 'package:vakinha_burguer/app/core/provider/application_bindings.dart';
import 'package:vakinha_burguer/app/pages/home/home_router.dart';
import 'package:vakinha_burguer/app/pages/order/completed/order_completed_page.dart';
import 'package:vakinha_burguer/app/pages/product_details/product_details_router.dart';
import 'package:vakinha_burguer/app/pages/splash/splash_page.dart';

import 'core/routes/routes.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/login/login_router.dart';
import 'pages/auth/register/register_router.dart';
import 'pages/order/order_router.dart';

class VakinhaBurguerApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();
  VakinhaBurguerApp({super.key}) {
    GlobalContext.i.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBindings(
      child: MaterialApp(
        title: 'Vakinha Burguer',
        theme: ThemeConfig.theme,
        navigatorKey: _navKey,
        routes: {
          Routes.splashPage: (_) => const SplashPage(),
          Routes.home: (_) => HomeRouter.page,
          Routes.productDetails: (_) => ProductDetailsRouter.page,
          Routes.login: (_) => LoginRouter.page,
          Routes.register: (_) => RegisterRouter.page,
          Routes.order: (_) => OrderRouter.page,
          Routes.orderCompleted: (_) => const OrderCompletedPage()
        },
      ),
    );
  }
}
