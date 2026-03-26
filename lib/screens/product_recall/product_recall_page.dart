import 'package:esilv_app/l10n/app_localizations.dart';
import 'package:esilv_app/model/product_recall.dart';
import 'package:esilv_app/res/app_icons.dart';
import 'package:esilv_app/screens/product_recall/data/product_recall_provider.dart';
import 'package:esilv_app/screens/product_recall/widgets/product_recall_picture.dart';
import 'package:esilv_app/screens/product_recall/widgets/product_recall_section.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductRecallPage extends StatelessWidget {
  const ProductRecallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.product_recall_header),
        actions: [
          IconButton(
            onPressed: () {
              // TODO
            },
            icon: Icon(AppIcons.share),
          ),
        ],
      ),
      body: ProductRecallProvider(
        productRecall: generateProductRecall(),
        child: ListView(
          children: [
            ProductRecallPicture(),
            _ProductRecallDates(),
            _ProductRecallDistributors(),
            _ProductRecallGeographicalArea(),
            _ProductRecallReason(),
            _ProductRecallSafetyMeasures(),
            _ProductRecallAdditionalInfo(),
            _ProductRecallActionRequired(),
          ],
        ),
      ),
    );
  }
}

class _ProductRecallDates extends StatelessWidget {
  const _ProductRecallDates();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final DateFormat dateFormat = DateFormat(
      'dd/MM/yyyy',
      appLocalizations.localeName,
    );

    final ProductRecall productRecall = ProductRecallProvider.of(
      context,
    ).productRecall;

    return ProductRecallSection(
      title: appLocalizations.product_recall_section_dates,
      content: appLocalizations.product_recall_dates_label(
        dateFormat.format(productRecall.saleStartDate),
        dateFormat.format(productRecall.saleEndDate),
      ),
    );
  }
}

class _ProductRecallDistributors extends StatelessWidget {
  const _ProductRecallDistributors();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ProductRecall productRecall = ProductRecallProvider.of(
      context,
    ).productRecall;

    return ProductRecallSection(
      title: appLocalizations.product_recall_section_distributors,
      content: productRecall.distributors,
    );
  }
}

class _ProductRecallGeographicalArea extends StatelessWidget {
  const _ProductRecallGeographicalArea();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ProductRecall productRecall = ProductRecallProvider.of(
      context,
    ).productRecall;

    return ProductRecallSection(
      title: appLocalizations.product_recall_geographical_area,
      content: productRecall.geographicalArea,
    );
  }
}

class _ProductRecallReason extends StatelessWidget {
  const _ProductRecallReason();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ProductRecall productRecall = ProductRecallProvider.of(
      context,
    ).productRecall;

    return ProductRecallSection(
      title: appLocalizations.product_recall_reason,
      content: productRecall.reason,
    );
  }
}

class _ProductRecallSafetyMeasures extends StatelessWidget {
  const _ProductRecallSafetyMeasures();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ProductRecall productRecall = ProductRecallProvider.of(
      context,
    ).productRecall;

    final String? safetyMeasures = productRecall.safetyMeasures;
    if (safetyMeasures == null) {
      return const SizedBox.shrink();
    }

    return ProductRecallSection(
      title: appLocalizations.product_recall_safety_measures,
      content: safetyMeasures,
    );
  }
}

class _ProductRecallAdditionalInfo extends StatelessWidget {
  const _ProductRecallAdditionalInfo();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ProductRecall productRecall = ProductRecallProvider.of(
      context,
    ).productRecall;

    final String? additionalInfo = productRecall.additionalInfo;
    if (additionalInfo == null) {
      return const SizedBox.shrink();
    }

    return ProductRecallSection(
      title: appLocalizations.product_recall_additional_info,
      content: additionalInfo,
    );
  }
}

class _ProductRecallActionRequired extends StatelessWidget {
  const _ProductRecallActionRequired();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ProductRecall productRecall = ProductRecallProvider.of(
      context,
    ).productRecall;

    final String? actionRequired = productRecall.actionRequired;
    if (actionRequired == null) {
      return const SizedBox.shrink();
    }

    return ProductRecallSection(
      title: appLocalizations.product_recall_action_required,
      content: actionRequired,
    );
  }
}
