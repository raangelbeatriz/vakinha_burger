import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer/app/core/extensions/formatter_extensions.dart';

import 'package:vakinha_burguer/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_increment_decrement.dart';
import 'package:vakinha_burguer/app/dto/order_product_dto.dart';
import 'package:vakinha_burguer/app/models/product_model.dart';
import 'package:vakinha_burguer/app/pages/product_details/product_details_controller.dart';

import '../../core/ui/base_state/base_state.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel productModel;
  final OrderProductDto? order;
  const ProductDetails(
      {Key? key, required this.productModel, required this.order})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState
    extends BaseState<ProductDetails, ProductDetailsController> {
  @override
  void onReady() {
    final amount = widget.order?.amount ?? 1;
    controller.initial(hasOrder: widget.order != null, amount: amount);
  }

  void _showConfirmDelete(int amount) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deseja excluir o produto?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancelar',
              style:
                  context.textStyles.textExtraBold.copyWith(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(
                context,
                OrderProductDto(product: widget.productModel, amount: amount),
              );
            },
            child: Text('Confirmar', style: context.textStyles.textExtraBold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.width,
            height: context.percentHeigth(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    widget.productModel.img,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.productModel.name,
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(widget.productModel.description),
              ),
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                height: 68,
                width: context.percentWidth(.5),
                child: BlocBuilder<ProductDetailsController, int>(
                  builder: (context, amount) {
                    return DeliveryIncrementDecrement(
                      amount: amount,
                      incrementOnTap: () {
                        controller.increment();
                      },
                      decrementOnTap: () {
                        controller.decrement();
                      },
                    );
                  },
                ),
              ),
              Container(
                height: 68,
                width: context.percentWidth(.5),
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailsController, int>(
                  builder: (context, amount) {
                    return ElevatedButton(
                      style: amount == 0
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.red)
                          : null,
                      onPressed: () {
                        if (amount == 0) {
                          _showConfirmDelete(amount);
                        } else {
                          Navigator.pop(
                            context,
                            OrderProductDto(
                                product: widget.productModel, amount: amount),
                          );
                        }
                      },
                      child: Visibility(
                        visible: amount > 0,
                        replacement: Text(
                          'Excluir produto',
                          style: context.textStyles.textExtraBold,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Adicionar',
                                style: context.textStyles.textExtraBold
                                    .copyWith(fontSize: 13),
                              ),
                            ),
                            Expanded(
                              child: AutoSizeText(
                                (widget.productModel.price * amount)
                                    .currencyPTBR,
                                maxFontSize: 13,
                                minFontSize: 5,
                                maxLines: 1,
                                textAlign: TextAlign.end,
                                style: context.textStyles.textExtraBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
