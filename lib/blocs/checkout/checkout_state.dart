part of 'checkout_cubit.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();
}

class CheckoutInitial extends CheckoutState {
  @override
  List<Object> get props => [];
}

class LoadingCheckout extends CheckoutState {
  @override
  List<Object> get props => [];
}

class Checkout extends CheckoutState {
  @override
  List<Object> get props => [];
}

class CheckoutFail extends CheckoutState {
  final String text;

  CheckoutFail({@required this.text});

  @override
  List<Object> get props => [];
}
