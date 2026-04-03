import 'package:esilv_app/model/product.dart';
import 'package:esilv_app/repositories/product_repository.dart';
import 'package:esilv_app/screens/product/data/product_provider_state.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ValueNotifier<ProductState> {
  ProductProvider({required this.barcode})
    : super(const ProductStateLoading()) {
    _loadProduct();
  }

  final String barcode;

  // Only use if value is ProductStateSuccess, otherwise it will throw an error
  Product get product => (value as ProductStateSuccess).product;

  Future<void> _loadProduct() async {
    value = const ProductStateLoading();

    try {
      Product product = await ProductRepository().getProduct(barcode);
      value = ProductStateSuccess(product: product);
    } catch (e) {
      value = ProductStateError(error: e);
    }
  }
}
