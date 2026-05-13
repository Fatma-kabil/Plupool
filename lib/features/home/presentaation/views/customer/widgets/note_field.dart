import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/pick_files_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/attach_file_bitton.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';

import 'attached_file.dart';
import '../../widgets/error_message.dart';

class NoteField extends StatefulWidget {
  final TextEditingController controller;

  const NoteField({super.key, required this.controller});

  @override
  State<NoteField> createState() => NoteFieldState();
}

class NoteFieldState extends State<NoteField> {
  List<File> attachedFiles = [];

  Future<void> _pickFile() async {
    final files = await pickFiles();

    if (files.isNotEmpty) {
      setState(() {
        attachedFiles.addAll(files);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) {
        if (widget.controller.text.trim().isEmpty && attachedFiles.isEmpty) {
          return "من فضلك اكتب ملاحظاتك أو أرفق ملف";
        }

        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(minHeight: SizeConfig.h(120)),
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

                  if (attachedFiles.isNotEmpty)
                    Positioned(
                      bottom: SizeConfig.h(4),
                      right: SizeConfig.w(8),
                      left: SizeConfig.w(40),
                      child: Wrap(
                        spacing: SizeConfig.w(8),
                        runSpacing: SizeConfig.h(8),
                        children: List.generate(attachedFiles.length, (index) {
                          return AttachedFile(
                            fileName: attachedFiles[index].path.split('/').last,
                            onRemove: () {
                              setState(() {
                                attachedFiles.removeAt(index);
                              });

                              field.didChange('');
                            },
                          );
                        }),
                      ),
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
