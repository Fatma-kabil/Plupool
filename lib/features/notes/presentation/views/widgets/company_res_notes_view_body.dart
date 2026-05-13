import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';

import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';

import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_state.dart';

import 'package:plupool/features/notes/presentation/views/widgets/admin_note_card.dart';
import 'package:plupool/features/notes/presentation/views/widgets/notes_shimmer_list.dart';
import 'package:plupool/features/notes/presentation/views/widgets/notes_view_header.dart';

class CompanyResNotesViewBody extends StatefulWidget {
  const CompanyResNotesViewBody({super.key, required this.user});

  final UserDetailsEntity user;

  @override
  State<CompanyResNotesViewBody> createState() =>
      _CompanyResNotesViewBodyState();
}

class _CompanyResNotesViewBodyState extends State<CompanyResNotesViewBody> {
  @override
  void initState() {
    super.initState();

    context.read<NotesCubit>().getNotes(widget.user.user.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
               NotesViewHeader(
                userId: widget.user.user.id,
               ),

              const SizedBox(height: 20),

              /// ================= LOADING =================
              if (state is GetNotesLoading)
                const Center(
                  child: NotesShimmerList(),
                ),

              /// ================= ERROR =================
              if (state is GetNotesError)
                Center(child: ErrorText(message: state.message)),

              /// ================= EMPTY =================
              if (state is GetNotesSuccess && state.notes.isEmpty)
                const Center(
                  child: ErrorText(message: 'لا توجد ملاحظات حالياً'),
                ),

              /// ================= SUCCESS =================
              if (state is GetNotesSuccess && state.notes.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.notes.length,
                  itemBuilder: (context, index) {
                    final note = state.notes[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AdminNoteCard(note: note),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
