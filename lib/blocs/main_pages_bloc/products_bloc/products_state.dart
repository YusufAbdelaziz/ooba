part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class LoadingProducts extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsFetchSuccess extends ProductsState {
  final List<Product> products;
  final bool hasReachedMax;
  ProductsFetchSuccess({@required this.products, @required this.hasReachedMax});

  ProductsFetchSuccess copyWith({List<Product> products, bool hasReachedMax}) {
    return ProductsFetchSuccess(
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      products: products ?? this.products,
    );
  }

  @override
  String toString() {
    return '{ProductsFetchSuccess : products length --> ${products.length}}';
  }

  @override
  List<Object> get props => [this.products, this.hasReachedMax];
}

class ProductsFetchFail extends ProductsState {
  final String text;

  ProductsFetchFail({@required this.text});

  @override
  List<Object> get props => [];
}
