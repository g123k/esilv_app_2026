import 'package:esilv_app/model/product.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends InheritedWidget {
  const ProductProvider({
    super.key,
    required super.child,
    required this.product,
  });

  final Product product;

  static ProductProvider of(BuildContext context) {
    final ProductProvider? result = context
        .dependOnInheritedWidgetOfExactType<ProductProvider>();
    assert(result != null, 'No ProductProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductProvider old) {
    return product != old.product;
  }
}
