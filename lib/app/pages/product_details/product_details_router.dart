import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer/app/pages/product_details/product_details.dart';
import 'package:vakinha_burguer/app/pages/product_details/product_details_controller.dart';

class ProductDetailsRouter {
  ProductDetailsRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: ((context) => ProductDetailsController()),
          ),
        ],
        builder: (context, child) {
          //Use instead of child when child requires business logic
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ProductDetails(
            productModel: args['product'],
            order: args['order'],
          );
        },
      );
}
