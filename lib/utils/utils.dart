import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.blue,
    ),
  );
}

showErrorSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.redAccent,
    ),
  );
}

Future<File?> pickImage({String fieldName = "file"}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);

  if (imageFile != null) {
    return File(imageFile.path); // Return File instead of Uint8List
  }
  return null; // Return null if no image is selected
}
