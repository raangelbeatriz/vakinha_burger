import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakinha_burguer/app/core/extensions/formatter_extensions.dart';
import 'package:vakinha_burguer/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer/app/dto/order_product_dto.dart';

import '../../../core/routes/routes.dart';

class ShoppingBag extends StatelessWidget {
  const ShoppingBag({Key? key, required this.bag}) : super(key: key);
  final List<OrderProductDto> bag;
  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('acessToken')) {
      navigator.pushNamed(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    var totalBag = bag
        .fold<double>(0.0, (total, element) => total += element.totalPrice)
        .currencyPTBR;
    return Container(
      width: context.width,
      height: 90,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.shopping_bag_outlined),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Ver sacola',
                style: context.textStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}
