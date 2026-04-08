import 'package:flutter/material.dart';

class ProductPageError extends StatelessWidget {
  const ProductPageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Une erreur est survenue',
              style: TextStyle(color: Colors.red[900]!, fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
