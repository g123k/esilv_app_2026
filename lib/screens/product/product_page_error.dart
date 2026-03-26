import 'package:flutter/material.dart';

class ProductPageError extends StatelessWidget {
  const ProductPageError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Une erreur est survenue',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
