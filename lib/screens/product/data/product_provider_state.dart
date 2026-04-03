import 'package:esilv_app/model/product.dart';

sealed class ProductState {
  const ProductState();
}

class ProductStateInitial extends ProductState {
  const ProductStateInitial();
}

class ProductStateLoading extends ProductState {
  const ProductStateLoading();
}

class ProductStateSuccess extends ProductState {
  const ProductStateSuccess({required this.product});

  final Product product;
}

class ProductStateError extends ProductState {
  const ProductStateError({this.error});

  final dynamic error;
}
