import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burguer/app/pages/order/widgets/order_product_tile.dart';
import 'package:vakinha_burguer/app/pages/order/widgets/payments_types_field.dart';
import 'package:validatorless/validatorless.dart';

import 'widgets/order_field.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final addressController = TextEditingController();

    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Carrinho',
                    style: context.textStyles.textTitle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/trashRegular.png'),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: OrderProductTile(),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do Pedido',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        r'R$200,00',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                  title: 'Endereço de Entrega',
                  hintText: 'Digite o endereço de entrega',
                  controller: addressController,
                  validator: Validatorless.required('Digite o endereço'),
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                  title: 'CPF',
                  hintText: 'Digite o CPF',
                  controller: addressController,
                  validator: Validatorless.required('Digite o CPF'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PaymentsTypesField()
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DeliveryButton(
                      height: 48,
                      width: double.infinity,
                      onPressed: () {},
                      label: 'FINALIZAR'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
