import 'package:dio/dio.dart';
import 'package:esilv_app/api/model/product_response.dart';
import 'package:retrofit/retrofit.dart';

part 'openfoodfacts_api.g.dart';

@RestApi()
abstract class OpenFoodFactsAPI {
  factory OpenFoodFactsAPI(Dio dio, {required String baseUrl}) =
      _OpenFoodFactsAPI;

  @GET('/getProduct')
  Future<ProductAPIEntity> loadProduct(@Query('barcode') String barcode);
}

class OpenFoodFactsAPIManager implements IAPIManager {
  factory OpenFoodFactsAPIManager() {
    _instance ??= OpenFoodFactsAPIManager._();
    return _instance!;
  }

  OpenFoodFactsAPIManager._()
    : _api = OpenFoodFactsAPI(
        Dio(),
        baseUrl: 'https://api.formation-flutter.fr/v2/',
      );

  static OpenFoodFactsAPIManager? _instance;

  final OpenFoodFactsAPI _api;

  @override
  Future<ProductAPIEntity> loadProduct(String barcode) =>
      _api.loadProduct(barcode);
}

abstract class IAPIManager {
  Future<ProductAPIEntity> loadProduct(String barcode);
}
