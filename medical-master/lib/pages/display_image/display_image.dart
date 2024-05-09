import 'dart:io';

import 'package:flutter/material.dart';

class ImageDisplayScreen extends StatelessWidget {
  final File? image;

  const ImageDisplayScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Display'),
      ),
      body: Center(
        child: image != null ? Image.file(image!) : Text('No image selected'),
      ),
    );
  }
}
