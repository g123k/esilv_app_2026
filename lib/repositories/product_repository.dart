import 'package:esilv_app/api/model/product_response.dart';
import 'package:esilv_app/api/openfoodfacts_api.dart';
import 'package:esilv_app/model/product.dart';
import 'package:esilv_app/repositories/i_product_repository.dart';

class ProductRepository implements IProductRepository {
  ProductRepository({IAPIManager? apiManager})
    : _apiManager = apiManager ?? OpenFoodFactsAPIManager();
  final IAPIManager _apiManager;

  @override
  Future<Product> getProduct(String barcode) async {
    if (barcode.isEmpty) {
      throw ArgumentError('Barcode cannot be empty');
    }

    try {
      final ProductAPIEntity response = await _apiManager.loadProduct(barcode);

      if (response.response == null) {
        throw Exception('Product not found');
      }

      return response.response!.toProduct();
    } catch (e) {
      rethrow;
    }
  }
}
