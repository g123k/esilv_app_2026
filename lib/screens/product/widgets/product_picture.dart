import 'package:esilv_app/screens/product/data/product_provider.dart';
import 'package:esilv_app/screens/product/product_page_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPicture extends StatelessWidget {
  const ProductPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 0.0,
      start: 0.0,
      end: 0.0,
      height: ProductPageBody.kImageHeight,
      child: Consumer<ProductProvider>(
        builder: (_, provider, _) => Image.network(
          provider.product.picture ?? '-',
          fit: BoxFit.cover,
          loadingBuilder: (_, Widget child, ImageChunkEvent? event) {
            if (event == null) {
              return child;
            }
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (_, _, _) =>
              const Center(child: Text("Impossible de charger l'image")),
          cacheHeight:
              (ProductPageBody.kImageHeight *
                      MediaQuery.devicePixelRatioOf(context))
                  .toInt(),
        ),
      ),
    );
  }
}
