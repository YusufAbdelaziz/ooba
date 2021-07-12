import 'dart:async';

import 'package:Ooba/models/cart_item.dart';
import 'package:Ooba/repos/cart_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if(event is AddToCart){
      yield LoadingCart();
      try{
        await CartRepo.addToCart(id: event.id, quantity: event.quantity);
        yield ProductAddedToCart();
      }catch(error){
        yield CartFail(text: error.toString());
      }
    }else if(event is LoadCart){
      yield LoadingCart();
      try{
        List<CartItem> items = await CartRepo.fetchCart();
        yield CartLoaded(items: items);
      }catch(error){
        yield CartFail(text: error.toString());
      }
    }
  }
}
