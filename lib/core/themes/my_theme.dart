import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/style/my_colors.dart';
import 'package:rick_and_morty/core/style/my_font_sizes.dart';

class MyTheme {
  final myTheme = ThemeData(
    primaryColor: MyColors.titleColor,
    scaffoldBackgroundColor: MyColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.appBarBackgroundColor,
      iconTheme: IconThemeData(color: MyColors.iconColor),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: MyColors.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: MyFontSizes.large,
      ),
      titleMedium: TextStyle(
        color: MyColors.subtitleColor,
        fontWeight: FontWeight.bold,
        fontSize: MyFontSizes.medium,
      ),
      bodyMedium: TextStyle(
        color: MyColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: MyFontSizes.small,
      ),
    ),
    cardTheme: CardThemeData(
      color: MyColors.cardColor,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    ),
    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: MyColors.buttonColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
