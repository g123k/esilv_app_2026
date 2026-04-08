import 'dart:io';

import 'package:esilv_app/l10n/app_localizations.dart';
import 'package:esilv_app/res/app_icons.dart';
import 'package:esilv_app/screens/product/data/product_favorite_notifier.dart';
import 'package:esilv_app/screens/product/data/product_provider.dart';
import 'package:esilv_app/screens/product/tabs/product_tab_0.dart';
import 'package:esilv_app/screens/product/tabs/product_tab_1.dart';
import 'package:esilv_app/screens/product/tabs/product_tab_2.dart';
import 'package:esilv_app/screens/product/tabs/product_tab_3.dart';
import 'package:esilv_app/screens/product/widgets/product_app_bar_icon.dart';
import 'package:esilv_app/screens/product/widgets/product_header.dart';
import 'package:esilv_app/screens/product/widgets/product_picture.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductPageBody extends StatelessWidget {
  const ProductPageBody({super.key});

  static const double kImageHeight = 300.0;
  static const double kContainerRadius = 16.0;
  static const double kHorizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageController>(create: (_) => PageController()),
        ChangeNotifierProvider<ProductFavoriteNotifier>(
          create: (_) =>
              ProductFavoriteNotifier(context.read<ProductProvider>().barcode),
        ),
      ],
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              ProductPicture(),
              Positioned.fill(
                child: Builder(
                  builder: (context) {
                    return PageView.builder(
                      controller: context.read<PageController>(),
                      itemCount: ProductPageTabs.values.length,
                      itemBuilder: (_, int index) =>
                          _ProductPageBodyTab(index: index),
                    );
                  },
                ),
              ),
              PositionedDirectional(
                top: 0.0,
                start: 0.0,
                child: ProductAppBarIcon(
                  icon: !kIsWeb && (Platform.isIOS || Platform.isMacOS)
                      ? const Icon(Icons.arrow_back_ios_new_rounded)
                      : const Icon(Icons.arrow_back_rounded),
                  onTap: context.pop,
                  semantics: MaterialLocalizations.of(
                    context,
                  ).backButtonTooltip,
                ),
              ),
              PositionedDirectional(
                top: 0.0,
                end: 0.0,
                child: Consumer<ProductFavoriteNotifier>(
                  builder: (_, ProductFavoriteNotifier notifier, _) {
                    return ProductAppBarIcon(
                      icon: Icon(
                        notifier.value == true
                            ? AppIcons.star
                            : AppIcons.star_empty,
                      ),
                      onTap: () => notifier.toggle(),
                      semantics: notifier.value == true
                          ? appLocalizations
                                .product_action_remove_from_favorites
                          : appLocalizations.product_action_add_to_favorites,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _ProductPageBottomTabs(),
      ),
    );
  }
}

class _ProductPageBodyTab extends StatelessWidget {
  const _ProductPageBodyTab({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight:
              MediaQuery.heightOf(context) - ProductPageBody.kImageHeight,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(ProductPageBody.kContainerRadius),
          ),
          color: Colors.white,
        ),
        margin: const EdgeInsetsDirectional.only(
          top: ProductPageBody.kImageHeight - ProductPageBody.kContainerRadius,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ProductHeader(),
            switch (ProductPageTabs.values[index]) {
              ProductPageTabs.summary => ProductTab0(),
              ProductPageTabs.info => ProductTab1(),
              ProductPageTabs.nutrition => ProductTab2(),
              ProductPageTabs.nutritionalValues => ProductTab3(),
            },
          ],
        ),
      ),
    );
  }
}

class _ProductPageBottomTabs extends StatelessWidget {
  const _ProductPageBottomTabs();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Selector<PageController, int>(
      selector: (_, PageController controller) =>
          (controller.page ?? 0).toInt(),
      builder: (BuildContext context, int page, _) => BottomNavigationBar(
        currentIndex: page.toInt(),
        onTap: (int position) => context.read<PageController>().animateToPage(
          position,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
        items: ProductPageTabs.values
            .map(
              (ProductPageTabs tab) => BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.label(appLocalizations),
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

enum ProductPageTabs {
  summary(AppIcons.tab_barcode),
  info(AppIcons.tab_fridge),
  nutrition(AppIcons.tab_nutrition),
  nutritionalValues(AppIcons.tab_array);

  const ProductPageTabs(this.icon);

  final IconData icon;

  String label(AppLocalizations appLocalizations) => switch (this) {
    ProductPageTabs.summary => appLocalizations.product_tab_summary,
    ProductPageTabs.info => appLocalizations.product_tab_properties,
    ProductPageTabs.nutrition => appLocalizations.product_tab_nutrition,
    ProductPageTabs.nutritionalValues =>
      appLocalizations.product_tab_nutrition_facts,
  };
}
