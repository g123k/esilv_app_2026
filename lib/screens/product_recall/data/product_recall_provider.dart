import 'package:esilv_app/model/product_recall.dart';
import 'package:flutter/widgets.dart';

class ProductRecallProvider extends InheritedWidget {
  const ProductRecallProvider({
    required super.child,
    required this.productRecall,
    super.key,
  });

  final ProductRecall productRecall;

  static ProductRecallProvider of(BuildContext context) {
    final ProductRecallProvider? result = context
        .dependOnInheritedWidgetOfExactType<ProductRecallProvider>();
    assert(result != null, 'No ProductRecallProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductRecallProvider old) {
    return productRecall != old.productRecall;
  }
}
