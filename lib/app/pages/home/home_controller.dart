import 'package:bloc/bloc.dart';
import 'package:vakinha_burguer/app/pages/home/home_state.dart';
import 'package:vakinha_burguer/app/repository/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;
  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.initial));
    try {
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e) {
      // TODO
    }
  }
}
