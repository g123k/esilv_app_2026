import 'package:esilv_app/l10n/app_localizations.dart';
import 'package:esilv_app/model/product.dart';
import 'package:esilv_app/res/app_colors.dart';
import 'package:esilv_app/res/app_icons.dart';
import 'package:esilv_app/res/app_theme_extension.dart';
import 'package:esilv_app/screens/product/data/product_provider.dart';
import 'package:esilv_app/screens/product/product_page_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTab0 extends StatelessWidget {
  const ProductTab0({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: .start,
      children: <Widget>[
        _Scores(),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: ProductPageBody.kHorizontalPadding,
            vertical: 30.0,
          ),
          child: _Info(),
        ),
      ],
    );
  }
}

class _Scores extends StatelessWidget {
  const _Scores();

  static const double _horizontalPadding = ProductPageBody.kHorizontalPadding;
  static const double _verticalPadding = 18.0;

  @override
  Widget build(BuildContext context) {
    final Product product = context.watch<ProductProvider>().product;

    return DefaultTextStyle(
      style: context.theme.altText,
      child: ColoredBox(
        color: AppColors.grey1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: _verticalPadding,
                horizontal: _horizontalPadding,
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 44,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5.0),
                        child: _NutriScore(
                          nutriscore:
                              product.nutriScore ?? ProductNutriScore.unknown,
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      flex: 56,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 25.0),
                        child: _NovaGroup(
                          novaScore:
                              product.novaScore ?? ProductNovaScore.unknown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: _verticalPadding,
                horizontal: _horizontalPadding,
              ),
              child: _GreenScore(
                greenScore: product.greenScore ?? ProductGreenScore.unknown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NutriScore extends StatelessWidget {
  const _NutriScore({required this.nutriscore});

  final ProductNutriScore nutriscore;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.nutriscore,
            style: context.theme.title3,
          ),
          const SizedBox(height: 5.0),
          Image.asset(
            _findAssetName(),
            semanticLabel: nutriscore.name.toUpperCase(),
            height: 42.0,
          ),
        ],
      ),
    );
  }

  String _findAssetName() {
    return switch (nutriscore) {
      ProductNutriScore.A => 'res/drawables/nutriscore_a.png',
      ProductNutriScore.B => 'res/drawables/nutriscore_b.png',
      ProductNutriScore.C => 'res/drawables/nutriscore_c.png',
      ProductNutriScore.D => 'res/drawables/nutriscore_d.png',
      ProductNutriScore.E => 'res/drawables/nutriscore_e.png',
      ProductNutriScore.unknown => 'TODO',
    };
  }
}

class _NovaGroup extends StatelessWidget {
  const _NovaGroup({required this.novaScore});

  final ProductNovaScore novaScore;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.nova_group,
            style: context.theme.title3,
          ),
          const SizedBox(height: 5.0),
          Text(_findLabel(), style: const TextStyle(color: AppColors.grey2)),
        ],
      ),
    );
  }

  String _findLabel() {
    return switch (novaScore) {
      ProductNovaScore.group1 =>
        'Aliments non transformés ou transformés minimalement',
      ProductNovaScore.group2 => 'Ingrédients culinaires transformés',
      ProductNovaScore.group3 => 'Aliments transformés',
      ProductNovaScore.group4 =>
        'Produits alimentaires et boissons ultra-transformés',
      ProductNovaScore.unknown => 'Score non calculé',
    };
  }
}

class _GreenScore extends StatelessWidget {
  const _GreenScore({required this.greenScore});

  final ProductGreenScore greenScore;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.greenscore,
            style: context.theme.title3,
          ),
          const SizedBox(height: 5.0),
          Row(
            children: <Widget>[
              Icon(
                _findIcon(),
                semanticLabel: greenScore.name,
                color: _findIconColor(),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  _findLabel(),
                  style: const TextStyle(color: AppColors.grey2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _findIcon() {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppIcons.greenscore_a_plus,
      ProductGreenScore.A => AppIcons.greenscore_a,
      ProductGreenScore.B => AppIcons.greenscore_b,
      ProductGreenScore.C => AppIcons.greenscore_c,
      ProductGreenScore.D => AppIcons.greenscore_d,
      ProductGreenScore.E => AppIcons.greenscore_e,
      ProductGreenScore.F => AppIcons.greenscore_f,
      ProductGreenScore.unknown => AppIcons.greenscore_e,
    };
  }

  Color _findIconColor() {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppColors.greenScoreAPlus,
      ProductGreenScore.A => AppColors.greenScoreA,
      ProductGreenScore.B => AppColors.greenScoreB,
      ProductGreenScore.C => AppColors.greenScoreC,
      ProductGreenScore.D => AppColors.greenScoreD,
      ProductGreenScore.E => AppColors.greenScoreE,
      ProductGreenScore.F => AppColors.greenScoreF,
      ProductGreenScore.unknown => Colors.transparent,
    };
  }

  String _findLabel() {
    return switch (greenScore) {
      ProductGreenScore.APlus => 'Très faible impact environnemental',
      ProductGreenScore.A => 'Très faible impact environnemental',
      ProductGreenScore.B => 'Faible impact environnemental',
      ProductGreenScore.C => "Impact modéré sur l'environnement",
      ProductGreenScore.D => 'Impact environnemental élevé',
      ProductGreenScore.E => 'Impact environnemental très élevé',
      ProductGreenScore.F => 'Impact environnemental très élevé',
      ProductGreenScore.unknown => 'Score non calculé',
    };
  }
}

class _Info extends StatelessWidget {
  const _Info();

  @override
  Widget build(BuildContext context) {
    final Product product = context.watch<ProductProvider>().product;
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _ProductItemValue(
          label: localizations.product_quantity,
          value: product.quantity ?? '-',
        ),
        _ProductItemValue(
          label: localizations.product_countries,
          value: product.manufacturingCountries?.join(', ') ?? '-',
          includeDivider: false,
        ),
        const SizedBox(height: 15.0),
        Row(
          children: <Widget>[
            Expanded(
              flex: 40,
              child: _ProductBubble(
                label: localizations.product_vegan,
                value: _ProductBubbleValue.off,
              ),
            ),
            const Spacer(flex: 10),
            Expanded(
              flex: 40,
              child: _ProductBubble(
                label: localizations.product_vegetarian,
                value: _ProductBubbleValue.on,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProductItemValue extends StatelessWidget {
  const _ProductItemValue({
    required this.label,
    required this.value,
    this.includeDivider = true,
  });

  final String label;
  final String value;
  final bool includeDivider;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 12.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Text(label)),
                Expanded(child: Text(value, textAlign: TextAlign.end)),
              ],
            ),
          ),
          if (includeDivider) const Divider(height: 1.0),
        ],
      ),
    );
  }
}

class _ProductBubble extends StatelessWidget {
  const _ProductBubble({required this.label, required this.value});

  final String label;
  final _ProductBubbleValue value;

  @override
  Widget build(BuildContext context) {
    final String semanticsValue = value == _ProductBubbleValue.on
        ? AppLocalizations.of(context)!.yes
        : AppLocalizations.of(context)!.no;
    return Semantics(
      label: '$label : $semanticsValue',
      excludeSemantics: true,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.blueLight,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              value == _ProductBubbleValue.on
                  ? AppIcons.checkmark
                  : AppIcons.close,
              color: AppColors.white,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _ProductBubbleValue { on, off }
