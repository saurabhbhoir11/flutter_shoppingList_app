import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/category.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() {
    return NewItemScreenState();
  }
}

class NewItemScreenState extends State<NewItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _enteredName = '';
  int _enteredQuantity = 1;
  Category _selectedCategory = categories[Categories.vegetables]!;

  void _saveItem() {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();
    print(_enteredName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add A New Item."),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(label: Text("Item Title")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter A Value";
                    } else if (value.trim().length < 2) {
                      return 'Please Enter A Title of Size Greater Than 2';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredName = value ?? '';
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(label: Text('Quantity')),
                        keyboardType: TextInputType.number,
                        initialValue: "1",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter A Value';
                          } else if (int.tryParse(value) == null) {
                            return 'Please Enter A Valid number.';
                          } else if (int.tryParse(value)! < 1) {
                            return 'Please Enter a number Greater Than 0.';
                          } else if (int.tryParse(value)! > 1000) {
                            return 'Please Enter A Value Less than 1000.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredQuantity = int.tryParse(value!) ?? 1;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField(
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(category.value.title),
                                ],
                              ),
                            ),
                        ],
                        onChanged: (value) {
                          _selectedCategory =
                              value ?? categories[Categories.vegetables]!;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _saveItem,
                      style: ButtonStyle(elevation: WidgetStatePropertyAll(10)),
                      child: const Text('Add Item'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
