import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer/app/pages/home/home_page.dart';

import '../../repository/products/products_repository.dart';
import '../../repository/products/products_repository_impl.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(context.read()),
          ),
        ],
        child: const HomePage(),
      );
}
