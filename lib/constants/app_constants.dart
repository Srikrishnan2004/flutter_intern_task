import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appTitle = 'Landscape Dropdown Dashboard';

  // Colors
  static const MaterialColor primaryColor = Colors.blue;
  static const Color backgroundColor = Colors.white;
  static const Color borderColor = Colors.grey;
  static const Color lightBackgroundColor = Color(0xFFE3F2FD); // Light blue

  // Sizing
  static const double borderRadius = 8.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 12.0;
  static const double paddingLarge = 16.0;

  // Font Sizes
  static const double fontSizeSmall = 9.0;
  static const double fontSizeMedium = 12.0;
  static const double fontSizeLarge = 14.0;

  // Data Table Dimensions
  static const double columnSpacing = 20.0;
  static const double dataRowMinHeight = 25.0;
  static const double dataRowMaxHeight = 35.0;
  static const double headingRowHeight = 30.0;
}

class AppStrings {
  static const String selectItemHint = 'Select item';
  static const String selectItemMessage =
      'Select an item from any dropdown to view data';

  // Table Headers
  static const String idHeader = 'ID';
  static const String nameHeader = 'Name';
  static const String priceHeader = 'Price';
  static const String stockHeader = 'Stock';
}
