import 'package:flutter/material.dart';

class ProductPageLoading extends StatelessWidget {
  const ProductPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
