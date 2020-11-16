part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {}

class ProductsFetched extends ProductsEvent {
  @override
  List<Object> get props => [];
}

class ProductsReloaded extends ProductsEvent {
  @override
  List<Object> get props => [];
}

