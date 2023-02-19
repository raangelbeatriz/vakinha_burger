import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:vakinha_burguer/app/dto/order_product_dto.dart';

part 'order_state.g.dart';

@match
enum OrderStatus { initial, loaded }

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> products;

  const OrderState({required this.status, required this.products});

  const OrderState.initial()
      : status = OrderStatus.initial,
        products = const [];
  @override
  List<Object?> get props => [];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDto>? products,
  }) {
    return OrderState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
