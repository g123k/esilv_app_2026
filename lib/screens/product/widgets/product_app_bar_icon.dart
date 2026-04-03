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
          child: SizedBox.square(
            dimension: kToolbarHeight,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onTap,
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
