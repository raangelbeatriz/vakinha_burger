import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/ui/helpers/messagea.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer/app/models/product_model.dart';
import 'package:vakinha_burguer/app/pages/home/widgets/delivery_product_tile.dart';

import '../../core/ui/helpers/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeliveryAppBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DeliveryProductTile(
                      product: ProductModel(
                          id: 1,
                          name: 'X-Tudo',
                          description:
                              'Lanche acompanha pão, hambúguer, mussarela, alface, tomate e maionese',
                          img:
                              'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800',
                          price: 15.00),
                    );
                  }),
            ),
          ],
        ));
  }
}
