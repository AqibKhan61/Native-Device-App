import 'package:flutter/material.dart';

class NewItems extends StatefulWidget {
  const NewItems({super.key});
  @override
  State<NewItems> createState() {
    return _NewItemsState();
  }
}

class _NewItemsState extends State<NewItems> {

  void _saveItem(){
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your Places!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _saveItem,
              icon: const Icon(Icons.add),
              label: const Text('AddPlace'),
            )
          ],
        )),
      ),
    );
  }
}
