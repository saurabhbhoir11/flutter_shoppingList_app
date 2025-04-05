import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key, required this.grocerires});

  final List<GroceryItem> grocerires;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Groceries')),
      body: ListView.builder(
        itemCount: grocerires.length,
        itemBuilder:
            (ctx, index) => ListTile(
              title: Text(grocerires[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: grocerires[index].category.color,
              ),
              trailing: Text(grocerires[index].quantity.toString()),
            ),
      ),
    );
  }
}
