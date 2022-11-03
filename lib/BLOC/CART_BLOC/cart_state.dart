part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartLoadingState extends CartState {

@override
  List<Object> get props =>[];

}

class CartLoadedState extends CartState{

  var items ;
  CartLoadedState({this.items});

  @override
  List<Object> get props => [items];

}


class CartErrorState extends CartState{

  String er_msg = "Something Went Worng";

  @override
  List<Object> get props => [er_msg];


}
