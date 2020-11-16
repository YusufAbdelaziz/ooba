part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddToCart extends CartEvent {
  final int id;
  final int quantity;
  const AddToCart({@required this.id,@required this.quantity});
  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}
