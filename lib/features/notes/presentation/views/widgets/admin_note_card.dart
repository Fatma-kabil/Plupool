import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/notes/presentation/views/widgets/date_time_notes.dart';
import 'package:plupool/features/notes/presentation/views/widgets/notes_row.dart';
import 'package:plupool/features/support/presentation/views/widgets/attachment_chip.dart';

class AdminNoteCard extends StatelessWidget {
  const AdminNoteCard({super.key});

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
          DateTimeNotes(),
          SizedBox(height: SizeConfig.h(12)),
          NotesRow(),
          SizedBox(height: SizeConfig.h(12)),
          Row(
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return AttachmentChip(fileName: "file.txt");
                },
              ),
              Spacer(),
              Icon(
                Icons.edit_document,
                size: SizeConfig.w(17),
                color: Color(0xff0077B6),
              ),
              SizedBox(width: SizeConfig.w(10),),
               Icon(
                Icons.delete_outline,
                size: SizeConfig.w(17),
                color: Color(0xffE63946),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
