import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:vakinha_burguer/app/dto/order_product_dto.dart';
import 'package:vakinha_burguer/app/models/payment_type_model.dart';

part 'order_state.g.dart';

@match
enum OrderStatus { initial, loading, loaded, error, updateOrder }

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> products;
  final List<PaymentTypeModel> paymentTypes;
  final String? errorMessage;

  const OrderState(
      {required this.status,
      required this.products,
      required this.paymentTypes,
      this.errorMessage});

  const OrderState.initial()
      : status = OrderStatus.initial,
        products = const [],
        paymentTypes = const [],
        errorMessage = null;

  double get totalOrder => products.fold(
      0.0, (previousValue, element) => previousValue + element.totalPrice);
  @override
  List<Object?> get props => [status, products, paymentTypes, errorMessage];

  OrderState copyWith(
      {OrderStatus? status,
      List<OrderProductDto>? products,
      List<PaymentTypeModel>? paymentTypes,
      String? errorMessage}) {
    return OrderState(
        status: status ?? this.status,
        products: products ?? this.products,
        paymentTypes: paymentTypes ?? this.paymentTypes,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
