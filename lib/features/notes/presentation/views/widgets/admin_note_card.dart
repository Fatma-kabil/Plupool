import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';

import 'package:plupool/core/utils/size_config.dart';

import 'package:plupool/features/notes/domain/entities/note_entity.dart';

import 'package:plupool/features/notes/presentation/views/widgets/date_time_notes.dart';
import 'package:plupool/features/notes/presentation/views/widgets/notes_row.dart';
import 'package:plupool/features/support/presentation/views/widgets/attachment_chip.dart';

class AdminNoteCard extends StatelessWidget {
  const AdminNoteCard({
    super.key,
    required this.note,
    this.onDelete,
    this.onEdit,
  });

  final NoteEntity note;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.h(8.0)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12.0),
        vertical: SizeConfig.h(16.0),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// DATE TIME
          DateTimeNotes(date: note.createdAt),

          SizedBox(height: SizeConfig.h(15)),

          /// NOTE TEXT
          if (note.note.trim().isNotEmpty)
            NotesRow(note: note.note)
          else
            SizedBox(),

          SizedBox(height: SizeConfig.h(15)),

          /// FILES
          if (note.files.isNotEmpty)
            Wrap(
              spacing: SizeConfig.w(8),
              runSpacing: SizeConfig.h(8),
              children: List.generate(note.files.length, (index) {
                final file = note.files[index];

                return AttachmentChip(
                  fileName: file.originalName,
                  fileUrl: file.fileUrl,
                );
              }),
            )
          else
            SizedBox(),

          SizedBox(height: SizeConfig.h(15)),

          /// ACTIONS
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onEdit,
                child: Icon(
                  Icons.edit_document,
                  size: SizeConfig.w(20),
                  color: const Color(0xff0077B6),
                ),
              ),

              SizedBox(width: SizeConfig.w(15)),

              GestureDetector(
                onTap: onDelete,
                child: Icon(
                  Icons.delete_outline,
                  size: SizeConfig.w(20),
                  color: const Color(0xffE63946),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
