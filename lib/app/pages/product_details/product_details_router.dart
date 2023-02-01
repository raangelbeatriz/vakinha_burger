import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer/app/pages/product_details/product_details.dart';

class ProductDetailsRouter {
  ProductDetailsRouter._();

  static Widget get page => MultiProvider(
        providers: [Provider(create: ((context) => Object()))],
        child: const ProductDetails(),
      );
}
