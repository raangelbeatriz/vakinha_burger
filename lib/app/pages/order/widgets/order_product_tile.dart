import 'package:flutter/material.dart';
import 'package:vakinha_burguer/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_increment_decrement.dart';

class OrderProductTile extends StatelessWidget {
  const OrderProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Image.network(
                'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800',
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
                        'X-Burguer',
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '19.90',
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
