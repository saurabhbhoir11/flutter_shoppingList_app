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
  final List<GroceryItem> _groceryList = [];

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => NewItemScreen()));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryList.add(newItem);
    });
  }

  void _removeItemAtIndex(int index) {
    setState(() {
      _groceryList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        "No Items Added Yet",
        style: TextStyle(fontSize: 25),
        softWrap: true,
      ),
    );

    if (_groceryList.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryList.length,
        itemBuilder:
            (ctx, index) => Dismissible(
              key: ValueKey(_groceryList[index].id),
              onDismissed: (direction) {
                _removeItemAtIndex(index);
              },
              child: ListTile(
                title: Text(
                  _groceryList[index].name,
                  style: TextStyle(fontSize: 20),
                ),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryList[index].category.color,
                ),
                trailing: Text(
                  _groceryList[index].quantity.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
