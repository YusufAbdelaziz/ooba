part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class LoadingCart extends CartState {
  @override
  List<Object> get props => [];
}

class ProductAddedToCart extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<CartItem> items;
  const CartLoaded({this.items});
  @override
  List<Object> get props => [];
}

class CartFail extends CartState {
  final String text;

  CartFail({@required this.text});

  @override
  List<Object> get props => [];
}
