import 'package:esilv_app/res/app_colors.dart';
import 'package:esilv_app/screens/product/widgets/product_title.dart';
import 'package:flutter/material.dart';

class ProductRecallSection extends StatelessWidget {
  const ProductRecallSection({
    required this.title,
    required this.content,
    super.key,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    if (content.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        ProductTitle(label: title),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.grey3),
          ),
        ),
      ],
    );
  }
}
