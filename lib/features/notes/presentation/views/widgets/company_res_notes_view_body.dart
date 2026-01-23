import 'package:flutter/material.dart';
import 'package:plupool/features/notes/presentation/views/widgets/admin_note_card.dart';
import 'package:plupool/features/notes/presentation/views/widgets/notes_view_header.dart';

class CompanyResNotesViewBody extends StatelessWidget {
  const CompanyResNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NotesViewHeader(),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return AdminNoteCard();
            },
          ),
        ],
      ),
    );
  }
}
