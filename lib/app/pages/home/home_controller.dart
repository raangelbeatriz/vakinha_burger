import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vakinha_burguer/app/pages/home/home_state.dart';
import 'package:vakinha_burguer/app/repository/products/products_repository.dart';

import '../../dto/order_product_dto.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;
  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar prdutos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }

  void addOrUpdateBag(OrderProductDto order) {
    final shoppingBag = [
      ...state.shoppingBag
    ]; //Spread operator duplicates list with new memory reference

    //Returns -1 if [element] is not found.
    final orderIndex =
        shoppingBag.indexWhere((orderP) => orderP.product == order.product);

    if (orderIndex > -1) {
      if (order.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = order;
      }
    } else {
      shoppingBag.add(order);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
