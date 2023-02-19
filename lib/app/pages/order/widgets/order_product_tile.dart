import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/extensions/formatter_extensions.dart';
import 'package:vakinha_burguer/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_increment_decrement.dart';
import 'package:vakinha_burguer/app/dto/order_product_dto.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;
  const OrderProductTile(
      {Key? key, required this.index, required this.orderProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = orderProduct.product;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Image.network(
                product.img,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (product.price * orderProduct.amount).currencyPTBR,
                            style: context.textStyles.textMedium.copyWith(
                                fontSize: 14, color: context.colors.secondary),
                          ),
                          DeliveryIncrementDecrement.compact(
                              amount: 1,
                              incrementOnTap: () {},
                              decrementOnTap: () {})
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
