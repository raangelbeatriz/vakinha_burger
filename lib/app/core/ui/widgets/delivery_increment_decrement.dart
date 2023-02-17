import 'package:flutter/material.dart';

import 'package:vakinha_burguer/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';

class DeliveryIncrementDecrement extends StatelessWidget {
  final int amount;
  final VoidCallback incrementOnTap;
  final VoidCallback decrementOnTap;
  final bool _compact;
  const DeliveryIncrementDecrement({
    super.key,
    required this.amount,
    required this.incrementOnTap,
    required this.decrementOnTap,
  }) : _compact = false;

  const DeliveryIncrementDecrement.compact({
    super.key,
    required this.amount,
    required this.incrementOnTap,
    required this.decrementOnTap,
  }) : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? const EdgeInsets.all(5) : null,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementOnTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                '-',
                style: context.textStyles.textMedium
                    .copyWith(fontSize: _compact ? 10 : 22, color: Colors.grey),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyles.textRegular.copyWith(
                fontSize: _compact ? 13 : 17, color: context.colors.secondary),
          ),
          InkWell(
            onTap: incrementOnTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                '+',
                style: context.textStyles.textMedium.copyWith(
                    fontSize: _compact ? 10 : 22,
                    color: context.colors.secondary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
