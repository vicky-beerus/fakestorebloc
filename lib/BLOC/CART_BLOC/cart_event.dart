part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStartedEvent extends CartEvent{

  @override
  List<Object> get props => [];
}

class CartItemAddedEvent extends CartEvent{

  var item;
  CartItemAddedEvent({this.item});

  @override
  List<Object> get props => [item];

}

class CartItemRemovedEvent extends CartEvent{

  var item;
  CartItemRemovedEvent({this.item});

  @override
  List<Object> get props =>[item];

}