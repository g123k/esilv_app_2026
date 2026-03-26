import 'package:esilv_app/screens/product_recall/data/product_recall_provider.dart';
import 'package:flutter/material.dart';

class ProductRecallPicture extends StatelessWidget {
  const ProductRecallPicture({super.key});

  @override
  Widget build(BuildContext context) {
    final String picture = ProductRecallProvider.of(
      context,
    ).productRecall.picture;

    return Image.network(
      picture,
      height: MediaQuery.heightOf(context) * 0.3,
      fit: BoxFit.cover,
      loadingBuilder: (_, Widget child, ImageChunkEvent? event) {
        if (event == null) {
          return child;
        }
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (_, _, _) =>
          const Center(child: Text("Impossible de charger l'image")),
      cacheHeight: (300.0 * MediaQuery.devicePixelRatioOf(context)).toInt(),
    );
  }
}
