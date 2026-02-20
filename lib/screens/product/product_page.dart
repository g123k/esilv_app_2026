import 'package:esilv_app/l10n/app_localizations.dart';
import 'package:esilv_app/model/product.dart';
import 'package:esilv_app/res/app_icons.dart';
import 'package:esilv_app/screens/product/product_provider.dart';
import 'package:esilv_app/screens/product/tabs/product_tab_0.dart';
import 'package:esilv_app/screens/product/tabs/product_tab_1.dart';
import 'package:esilv_app/screens/product/tabs/product_tab_2.dart';
import 'package:esilv_app/screens/product/tabs/product_tab_3.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  static const double IMAGE_HEIGHT = 300.0;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductDetailsCurrentTab _tab;

  @override
  void initState() {
    super.initState();
    _tab = ProductDetailsCurrentTab.values.first;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return ProductProvider(
      product: generateProduct(),
      child: Scaffold(
        body: Stack(
          children: [
            Offstage(
              offstage: _tab != ProductDetailsCurrentTab.summary,
              child: ProductTab0(),
            ),
            Offstage(
              offstage: _tab != ProductDetailsCurrentTab.info,
              child: ProductTab1(),
            ),
            Offstage(
              offstage: _tab != ProductDetailsCurrentTab.nutrition,
              child: ProductTab2(),
            ),
            Offstage(
              offstage: _tab != ProductDetailsCurrentTab.nutritionalValues,
              child: ProductTab3(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tab.index,
          onTap: (int position) {
            _tab = ProductDetailsCurrentTab.values[position];
            setState(() {});
          },
          items: ProductDetailsCurrentTab.values
              .map(
                (ProductDetailsCurrentTab tab) => BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  label: tab.label(appLocalizations),
                ),
              )
              .toList(growable: false),
        ),
      ),
    );
  }
}

enum ProductDetailsCurrentTab {
  summary(AppIcons.tab_barcode),
  info(AppIcons.tab_fridge),
  nutrition(AppIcons.tab_nutrition),
  nutritionalValues(AppIcons.tab_array);

  const ProductDetailsCurrentTab(this.icon);

  final IconData icon;

  String label(AppLocalizations appLocalizations) => switch (this) {
    ProductDetailsCurrentTab.summary => appLocalizations.product_tab_summary,
    ProductDetailsCurrentTab.info => appLocalizations.product_tab_properties,
    ProductDetailsCurrentTab.nutrition =>
      appLocalizations.product_tab_nutrition,
    ProductDetailsCurrentTab.nutritionalValues =>
      appLocalizations.product_tab_nutrition_facts,
  };
}
