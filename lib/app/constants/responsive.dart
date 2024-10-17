import 'package:flutter/material.dart';

class Responsive {
  Responsive(BuildContext context) {
    allframewidth = MediaQuery.of(context).size.width / 1.3;
    condframewidth = MediaQuery.of(context).size.width / 1.7;
    dataframewidth = MediaQuery.of(context).size.width / 1.9;
  }
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double allframewidth = 0; 
  static double condframewidth = 0;
  static double dataframewidth = 0; 
}
