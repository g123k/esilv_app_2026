import 'package:esilv_app/res/app_colors.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.label})
    : assert(label.length > 0);

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ColoredBox(
        color: AppColors.grey1,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 8.0,
            vertical: 7.0,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blue,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
