import 'package:esilv_app/l10n/app_localizations.dart';
import 'package:esilv_app/model/product.dart';
import 'package:esilv_app/screens/product/data/product_provider.dart';
import 'package:esilv_app/screens/product/widgets/product_title.dart';
import 'package:flutter/material.dart';

class ProductTab1 extends StatelessWidget {
  const ProductTab1({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = ProductProvider.of(context).product;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Column(
      spacing: 10.0,
      children: [
        _ProductList(
          label: appLocalizations.product_properties_ingredients,
          content: product.ingredients,
        ),
        _ProductList(
          label: appLocalizations.product_properties_allergens,
          content: product.allergens,
        ),
        _ProductList(
          label: appLocalizations.product_properties_additives,
          content: product.additives?.keys,
        ),
      ],
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({required this.label, required this.content});

  final String label;
  final Iterable<String>? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductTitle(label: label),
        if (content != null)
          ListView.separated(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            itemBuilder: (_, int index) =>
                _ProductListItem(item: content!.elementAt(index)),
            separatorBuilder: (_, _) => const Divider(),
            itemCount: content!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        else
          Text(AppLocalizations.of(context)!.product_properties_empty),
      ],
    );
  }
}

class _ProductListItem extends StatelessWidget {
  const _ProductListItem({required this.item});

  final String item;

  @override
  Widget build(BuildContext context) {
    final String text = _formatValue(item);
    final RegExpMatch? match = RegExp(
      r'^(.*?)\s*\((.*?)\)\s*$',
    ).firstMatch(text);

    final Widget child;
    if (match != null) {
      child = Row(
        crossAxisAlignment: .start,
        children: [
          Expanded(child: Text(match.group(1)!.trim())),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.widthOf(context) * 0.4,
            ),
            child: Text(match.group(2)!.trim(), textAlign: TextAlign.end),
          ),
        ],
      );
    } else {
      child = Text(text);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 12.0),
      child: child,
    );
  }

  String _formatValue(String value) {
    final String text = value.replaceAll('_', '');
    return text[0].toUpperCase() + text.substring(1);
  }
}
