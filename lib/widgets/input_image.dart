import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
  const InputImage({super.key});
  @override
  State<InputImage> createState() {
    return _InputImageState();
  }
}

class _InputImageState extends State<InputImage> {
  File? _selectedImage;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera),
      label: const Text('Take A Pic'),
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        onTap: _takePicture,
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      height: 200,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
