import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../REPOSITRY/product_repositry.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  final ProductReposiry productReposiry;


  CartBloc({required this.productReposiry}): super(CartLoadingState()){

    on<CartStartedEvent>(_onStrated);
    on<CartItemAddedEvent>(_onItmeAdded);
    on<CartItemRemovedEvent>(_onItemRemoved);
  }

  Future _onStrated(CartStartedEvent event, Emitter<CartState> emit)async{
    emit(CartLoadingState());
    try{
      final items = await productReposiry.getCartItmes();
      emit(CartLoadedState(items: items));
    }catch(e){
      emit(CartErrorState());
    }
  }

  Future _onItmeAdded(CartItemAddedEvent event, Emitter<CartState> emit)async{

    final state =this.state;
    if(state is CartLoadedState){
      try{
        productReposiry.addItems(event.item);
        emit(CartLoadedState(items: [...state.items,event.item]));
      }catch(e){
        emit(CartErrorState());
      }
    }

  }


  Future _onItemRemoved(CartItemRemovedEvent event, Emitter<CartState> emit)async{
    final state = this.state;
    if(state is CartLoadedState){
      try {
        productReposiry.removeItem(event.item);
        emit(
            CartLoadedState(
                items: [...state.items]..remove(event.item)
            )
        );
      } catch(e){
        emit(CartErrorState());
      }
    }

  }


}
