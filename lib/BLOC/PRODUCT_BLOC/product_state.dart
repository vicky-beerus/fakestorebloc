part of 'product_bloc.dart';

abstract class ProductState extends Equatable {}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  final ProductModel product;

  ProductLoadedState(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
