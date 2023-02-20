import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vakinha_burguer/app/dto/order_product_dto.dart';
import 'package:vakinha_burguer/app/repository/order/order_repository.dart';

import 'order_state.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;
  OrderController(this._orderRepository) : super(const OrderState.initial());

  Future<void> load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final paymentsTypes = await _orderRepository.getAllPaymentsTypes();
      emit(state.copyWith(
          status: OrderStatus.loaded,
          products: products,
          paymentTypes: paymentsTypes));
    } catch (e, s) {
      log('Erro ao carregar página', error: e, stackTrace: s);
      emit(state.copyWith(
          status: OrderStatus.error, errorMessage: 'Erro ao carregar página'));
    }
  }

  void incrementProduct(int index) {
    final orders = [...state.products];
    final order = orders[index];
    orders[index] = order.copyWith(amount: order.amount + 1);
    emit(
      state.copyWith(products: orders, status: OrderStatus.updateOrder),
    );
  }

  void decrementProduct(int index) {
    final orders = [...state.products];
    final order = orders[index];

    if (order.amount == 1) {
    } else {
      orders[index] = order.copyWith(amount: order.amount - 1);
      emit(
        state.copyWith(products: orders, status: OrderStatus.updateOrder),
      );
    }
  }
}
