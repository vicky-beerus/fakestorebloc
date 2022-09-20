import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakestorebloc/MODEL/model_product.dart';

import '../../REPOSITRY/product_repositry.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductReposiry productReposiry;
  ProductBloc(this.productReposiry) : super(ProductLoadingState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());

      try {
        final prod = await productReposiry.getProducts();
        emit(ProductLoadedState(prod));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
