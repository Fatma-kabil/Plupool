import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/pick_file.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/attach_file_bitton.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';

import 'attached_file.dart';
import '../../widgets/error_message.dart'; // ✅ استدعاء الفانكشن الجديدة

class NoteField extends StatefulWidget {
  final TextEditingController controller;

  const NoteField({super.key, required this.controller});

  @override
  State<NoteField> createState() => _NoteFieldState();
}

class _NoteFieldState extends State<NoteField> {
  String? attachedFileName;

  Future<void> _pickFile() async {
    final fileName = await pickFile(); // ✅ استخدمنا الهيلبر
    if (fileName != null) {
      setState(() {
        attachedFileName = fileName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) {
        if (widget.controller.text.trim().isEmpty &&
            (attachedFileName == null || attachedFileName!.isEmpty)) {
          return "من فضلك اكتب ملاحظاتك أو أرفق ملف";
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: field.hasError
                      ? Colors.red
                      : AppColors.textFieldBorderColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  NoteTextField(
                    controller: widget.controller,
                    onChanged: field.didChange,
                  ),
                  if (attachedFileName != null)
                    AttachedFile(
                      fileName: attachedFileName!,
                      onRemove: () => setState(() => attachedFileName = null),
                    ),
                  AttachFileButton(onPickFile: _pickFile),
                ],
              ),
            ),
            if (field.hasError) ErrorMessage(message: field.errorText!),
          ],
        );
      },
    );
  }
}
