import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer/app/pages/order/order_controller.dart';
import 'package:vakinha_burguer/app/pages/order/order_page.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (_) => OrderController(),
          ),
        ],
        child: const OrderPage(),
      );
}
