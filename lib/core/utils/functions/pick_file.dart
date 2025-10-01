import 'package:file_picker/file_picker.dart';

/// بترجع اسم الملف اللي المستخدم اختاره
Future<String?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.any,
  );

  if (result != null && result.files.isNotEmpty) {
    return result.files.first.name;
  }
  return null;
}
