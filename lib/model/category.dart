import 'package:flutter/material.dart';


import '../my_theme.dart';

class Category {
  String id;
  String title;
  String imageUrl;
  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.color,
      required this.imageUrl});

  static List<Category> getCategories() {
    return [
      Category(
        id: 'sports',
        title: 'Sports',
        color: MyTheme.redColor,
        imageUrl: 'assets/images/ball.png',
      ),
      Category(
        id: 'general',
        title: 'General',
        color: MyTheme.darkBlueColor,
        imageUrl: 'assets/images/Politics.png',
      ),
      Category(
        id: 'health',
        title: 'Health',
        color: MyTheme.pinkColor,
        imageUrl: 'assets/images/health.png',
      ),
      Category(
        id: 'business',
        title: 'Business',
        color: MyTheme.brownColor,
        imageUrl: 'assets/images/business.png',
      ),
      Category(
        id: 'entertainment',
        title: 'Entertainment',
        color: MyTheme.blueColor,
        imageUrl: 'assets/images/entertainment.png',
      ),
      Category(
        id: 'science',
        title: 'Science',
        color: MyTheme.yellowColor,
        imageUrl: 'assets/images/science.png',
      ),
      Category(
        id: 'technology',
        title: 'Technology',
        color: MyTheme.darkBlueColor,
        imageUrl: 'assets/images/science.png',
      ),
    ];
  }
}
