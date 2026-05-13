import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';

import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';

import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_state.dart';

class DeleteNoteBtn extends StatelessWidget {
  const DeleteNoteBtn({super.key, required this.userId, required this.noteId});

  final int userId;
  final int noteId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (dialogContext) {
            final cubit = context.read<NotesCubit>();

            return BlocConsumer<NotesCubit, NotesState>(
              bloc: cubit,
              listener: (context, state) {
                /// ✅ success
                if (state is DeleteNoteSuccess) {
                  Navigator.pop(dialogContext);

                  showCustomSnackBar(
                    context: context,
                    message: "تم حذف الملاحظة بنجاح 🗑️",
                    isSuccess: true,
                  );
                }

                /// ❌ error
                if (state is DeleteNoteError) {
                  Navigator.pop(dialogContext);

                  showCustomSnackBar(context: context, message: state.message);
                }
              },
              builder: (context, state) {
                final isLoading = state is DeleteNoteLoading;

                return DeleteOrderCard(
                  text: "هل أنت متأكد من حذف هذه الملاحظة؟",
                  isLoading: isLoading,
                  onPressed: isLoading
                      ? null
                      : () {
                          cubit.deleteNote(userId: userId, noteId: noteId);
                        },
                );
              },
            );
          },
        );
      },
      child: Icon(
        Icons.delete_outline_rounded,
        color: const Color(0xffE63946),
        size: SizeConfig.w(20),
      ),
    );
  }
}
