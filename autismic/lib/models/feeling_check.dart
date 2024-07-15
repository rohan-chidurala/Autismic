import 'package:flutter/material.dart';

class FeelingCheck {
  String name;
  String iconPath;
  Color boxColor;

  FeelingCheck({
    required this.name,
    required this.boxColor,
    required this.iconPath,
  });

  static List<FeelingCheck> getCategories() {
    List<FeelingCheck> categories = [];
    categories.add(
      FeelingCheck(name: 'Happy',iconPath: 'assets/icons/', boxColor: Color(0xffEF5DA8))
    );
    categories.add(
      FeelingCheck(name: 'Calm',iconPath: 'assets/icons/', boxColor: Color(0xffAEAFF7))
    );
    categories.add(
      FeelingCheck(name: 'Angry',iconPath: 'assets/icons/', boxColor: Color(0xffF09E54))
    );
    categories.add(
      FeelingCheck(name: 'IDK',iconPath: 'assets/icons/', boxColor: Color(0xffA0E3E2))
    );
    return categories;
  }
}
