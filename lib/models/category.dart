import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convinience,
  hygiene,
  other,
}

class Category {
  const Category({required this.title, required this.color});

  final String title;
  final Color color;
}
