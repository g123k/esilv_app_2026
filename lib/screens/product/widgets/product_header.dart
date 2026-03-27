import 'package:esilv_app/l10n/app_localizations.dart';
import 'package:esilv_app/model/product.dart';
import 'package:esilv_app/model/product_recall.dart';
import 'package:esilv_app/res/app_colors.dart';
import 'package:esilv_app/res/app_theme_extension.dart';
import 'package:esilv_app/screens/product/data/product_provider.dart';
import 'package:esilv_app/screens/product/product_page_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = ProductProvider.of(context).product;

    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 30.0,
        start: ProductPageBody.kHorizontalPadding - 2.0,
        end: ProductPageBody.kHorizontalPadding - 2.0,
        bottom: 10.0,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 6.0),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(product.name ?? '-', style: context.theme.title1),
                Text(
                  product.brands?.join(', ') ?? '-',
                  style: context.theme.title2,
                ),
              ],
            ),
          ),

          _ProductRecallBanner(),
        ],
      ),
    );
  }
}

class _ProductRecallBanner extends StatelessWidget {
  const _ProductRecallBanner();

  static const BorderRadius _kBorderRadius = .all(.circular(10.0));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 14.0, bottom: 24.0),
      child: Material(
        color: AppColors.productRecallBackground,
        borderRadius: _kBorderRadius,
        child: InkWell(
          borderRadius: _kBorderRadius,
          onTap: () =>
              context.push('/product/recall', extra: generateProductRecall()),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 19.0,
                vertical: 14.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.product_recall_banner,
                      style: TextStyle(
                        color: AppColors.productRecallForeground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.productRecallForeground,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
