import 'package:flutter/material.dart';
import 'package:newapp/widgets/new_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _addItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((ctx) => const NewItems()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
