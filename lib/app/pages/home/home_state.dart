import 'package:equatable/equatable.dart';

import 'package:vakinha_burguer/app/models/product_model.dart';

enum HomeStateStatus { initial, loading, loaded }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;

  const HomeState({required this.status, required this.products});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [];
  @override
  List<Object?> get props => [status, products];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
