import 'dart:io';
import 'package:flutter/material.dart';
import 'package:newapp/widgets/input_image.dart';
import 'package:newapp/providers/user_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewItems extends ConsumerStatefulWidget {
  const NewItems({super.key});
  @override
  ConsumerState<NewItems> createState() {
    return _NewItemsState();
  }
}

class _NewItemsState extends ConsumerState<NewItems> {
  final _titleController = TextEditingController();
  File? selectedImagee;

  @override
  void dispose() {
    _titleController;
    super.dispose();
  }

  void savePlace() {
    final enteredtitle = _titleController.text;
    if (enteredtitle.isEmpty || selectedImagee == null) {
      return;
    }
    ref
        .read(userPlaceProvider.notifier)
        .addPlaces(enteredtitle, selectedImagee!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add your Places!'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InputImage(onpickImage: (image) {
                selectedImagee = image;
              }),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton.icon(
                onPressed: savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              ),
            ],
          ),
        ));
  }
}
