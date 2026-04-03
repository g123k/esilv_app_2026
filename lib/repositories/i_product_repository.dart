import 'package:esilv_app/model/product.dart';

abstract class IProductRepository {
  Future<Product> getProduct(String barcode);
}
