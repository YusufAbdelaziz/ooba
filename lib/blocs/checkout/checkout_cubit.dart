import 'package:Ooba/repos/cart_repo/cart_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  Future<void> checkout(int addressId) async {
    emit(LoadingCheckout());
    if (await CartRepo.checkout(addressId)) {
      emit(Checkout());
    } else
      emit(CheckoutFail(text: "try again later"));
  }
}
