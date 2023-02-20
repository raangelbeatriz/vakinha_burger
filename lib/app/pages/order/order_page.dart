import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer/app/core/extensions/formatter_extensions.dart';
import 'package:vakinha_burguer/app/models/payment_type_model.dart';
import 'package:vakinha_burguer/app/pages/order/order_controller.dart';
import 'package:vakinha_burguer/app/pages/order/order_state.dart';
import 'package:validatorless/validatorless.dart';

import 'package:vakinha_burguer/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/delivery_button.dart';
import 'package:vakinha_burguer/app/dto/order_product_dto.dart';
import 'package:vakinha_burguer/app/pages/order/widgets/order_product_tile.dart';
import 'package:vakinha_burguer/app/pages/order/widgets/payments_types_field.dart';

import '../../core/ui/base_state/base_state.dart';
import 'widgets/order_field.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _cpfController = TextEditingController();
  int? paymentTypeId;
  final paymentValid = ValueNotifier<bool>(true);
  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
    super.onReady();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            loaded: () => hideLoader(),
            loading: () => showLoader(),
            updateOrder: () => hideLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro');
            });
      },
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, controller.state.products);
          return true;
        },
        child: Scaffold(
          appBar: DeliveryAppBar(),
          body: Form(
            key: _formKey,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
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
                BlocSelector<OrderController, OrderState,
                    List<OrderProductDto>>(
                  selector: (state) => state.products,
                  builder: (context, products) {
                    return SliverList(
                        delegate: SliverChildBuilderDelegate(
                      childCount: products.length,
                      (context, index) {
                        return OrderProductTile(
                          index: index,
                          orderProduct: products[index],
                        );
                      },
                    ));
                  },
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
                            BlocSelector<OrderController, OrderState, double>(
                              selector: (state) {
                                return state.totalOrder;
                              },
                              builder: (context, totalOrder) {
                                return Text(
                                  totalOrder.currencyPTBR,
                                  style: context.textStyles.textExtraBold
                                      .copyWith(fontSize: 16),
                                );
                              },
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
                        controller: _addressController,
                        validator:
                            Validatorless.required('Endereço obrigatório'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OrderField(
                        title: 'CPF',
                        hintText: 'Digite o CPF',
                        controller: _cpfController,
                        validator: Validatorless.required('CPF obrigatório'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocSelector<OrderController, OrderState,
                          List<PaymentTypeModel>>(
                        selector: (state) {
                          return state.paymentTypes;
                        },
                        builder: (context, paymentTypes) {
                          return ValueListenableBuilder(
                              valueListenable: paymentValid,
                              builder: (_, paymentValidValue, child) {
                                return PaymentsTypesField(
                                  valid: paymentValidValue,
                                  valueChanged: (value) {
                                    paymentTypeId = value;
                                  },
                                  selectedValue: paymentTypeId.toString(),
                                  paymentTypes: paymentTypes,
                                );
                              });
                        },
                      )
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
                            onPressed: () {
                              paymentValid.value = paymentTypeId != null;
                              if (_formKey.currentState?.validate() ?? false) {}
                            },
                            label: 'FINALIZAR'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
