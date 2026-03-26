import 'package:esilv_app/model/product.dart';
import 'package:esilv_app/screens/product/data/product_provider.dart';
import 'package:esilv_app/screens/product/product_page_body.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductProvider(
      product: generateProduct(),
      child: ProductPageBody(),
    );
  }
}
