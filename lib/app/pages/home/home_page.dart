import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer/app/core/ui/helpers/messagea.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer/app/models/product_model.dart';
import 'package:vakinha_burguer/app/pages/home/home_controller.dart';
import 'package:vakinha_burguer/app/pages/home/home_state.dart';
import 'package:vakinha_burguer/app/pages/home/widgets/delivery_product_tile.dart';

import '../../core/ui/helpers/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return DeliveryProductTile(
                          product: product,
                        );
                      }),
                ),
              ],
            );
          }),
    );
  }
}
