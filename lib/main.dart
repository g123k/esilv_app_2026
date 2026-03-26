import 'package:esilv_app/l10n/app_localizations.dart';
import 'package:esilv_app/res/app_colors.dart';
import 'package:esilv_app/res/app_theme_extension.dart';
import 'package:esilv_app/screens/product/product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        extensions: [OffThemeExtension.defaultValues()],
        fontFamily: 'Avenir',
        appBarTheme: AppBarThemeData(centerTitle: false),
        navigationBarTheme: const NavigationBarThemeData(
          indicatorColor: AppColors.blue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.grey2,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
        ),
        dividerTheme: DividerThemeData(color: AppColors.divider, space: 1.0),
      ),
      debugShowCheckedModeBanner: false,
      // TODO On modifie ici la page à afficher
      home: const ProductPage(),
    );
  }
}
