import 'package:flutter/material.dart';
import 'package:plupool/features/notes/presentation/views/widgets/notes_view_header.dart';

class CompanyResNotesViewBody extends StatelessWidget {
  const CompanyResNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: [NotesViewHeader()]));
  }
}
