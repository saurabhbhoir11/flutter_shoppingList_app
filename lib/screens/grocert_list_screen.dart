import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/screens/new_item_screen.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key, required this.grocerires});

  final List<GroceryItem> grocerires;

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  void _addItem() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => NewItemScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: widget.grocerires.length,
        itemBuilder:
            (ctx, index) => ListTile(
              title: Text(widget.grocerires[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: widget.grocerires[index].category.color,
              ),
              trailing: Text(widget.grocerires[index].quantity.toString()),
            ),
      ),
    );
  }
}
