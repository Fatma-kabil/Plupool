import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future<List<File>> pickFiles() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
  );

  if (result != null) {
    return result.files
        .where((file) => file.path != null)
        .map((file) => File(file.path!)) // ✅ هنا التعديل
        .toList();
  }

  return [];
}