import 'package:bloc/bloc.dart';

class ProductDetailsController extends Cubit<int> {
  ProductDetailsController() : super(1);

  late final bool _hasOrder;

  void initial({required bool hasOrder, required int amount}) {
    _hasOrder = hasOrder;
    emit(amount);
  }

  void increment() => emit(state + 1);

  void decrement() {
    if (state > (_hasOrder ? 0 : 1)) {
      emit(state - 1);
    }
  }
}
