import 'package:shopping_list_app/models/category.dart';

class GroceryItem {
  const GroceryItem({
    required this.name,
    required this.id,
    required this.quantity,
    required this.category,
  });

  final String id;
  final String name;
  final int quantity;
  final Category category;
}
