import 'package:esilv_app/res/app_colors.dart';
import 'package:esilv_app/res/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes scans'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(AppIcons.barcode),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            SvgPicture.asset('res/svg/ill_empty.svg'),
            SizedBox(height: 50.0),
            Text('Vous n\'avez pas encore scanné de produit'),
            SizedBox(height: 50.0),
            TextButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.blue,
                backgroundColor: AppColors.yellow,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: .min,
                children: [
                  Text('Commencer'),
                  Icon(Icons.arrow_right_alt_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
