import 'package:flutter/material.dart';

class ProductAppBarIcon extends StatelessWidget {
  const ProductAppBarIcon({super.key, required this.icon, required this.onTap});

  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconTheme.merge(
      data: const IconThemeData(color: Colors.white),
      child: SafeArea(
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(8.0),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
