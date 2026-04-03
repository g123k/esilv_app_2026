import 'package:esilv_app/screens/product/data/product_provider.dart';
import 'package:esilv_app/screens/product/data/product_provider_state.dart';
import 'package:esilv_app/screens/product/product_page_body.dart';
import 'package:esilv_app/screens/product/product_page_error.dart';
import 'package:esilv_app/screens/product/product_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.barcode});

  final String barcode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(barcode: barcode),
      child: Consumer<ProductProvider>(
        builder: (BuildContext context, ProductProvider value, Widget? child) {
          return switch (value.value) {
            ProductStateInitial() => const ProductPageLoading(),
            ProductStateLoading() => const ProductPageLoading(),
            ProductStateSuccess() => ProductPageBody(),
            ProductStateError() => const ProductPageError(),
          };
        },
      ),
    );
  }
}
