import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishFormPage extends StatefulWidget {
  @override
  _WishFormPageState createState() => _WishFormPageState();
}

class _WishFormPageState extends State<WishFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Item')),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_onSave()},
        tooltip: 'Add new Item',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onSave() {
    print('save item...');
  }

  Widget _buildBody(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter item name',
              icon: Icon(Icons.new_label),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter item price',
              icon: Icon(Icons.euro),
            ),
          ),
        ],
      ),
    );
  }
}
