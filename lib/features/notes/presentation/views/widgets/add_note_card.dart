import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/note_field.dart';
import 'package:plupool/features/notes/data/models/note_model.dart';
import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_state.dart';

class AddNoteCard extends StatefulWidget {
  const AddNoteCard({super.key, required this.userId});

  final int userId;

  @override
  State<AddNoteCard> createState() => _AddNoteCardState();
}

class _AddNoteCardState extends State<AddNoteCard> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _noteController = TextEditingController();

  final GlobalKey<NoteFieldState> noteFieldKey = GlobalKey<NoteFieldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          /// ✅ SUCCESS
          if (state is AddNoteSuccess) {
            Navigator.pop(context);

            showCustomSnackBar(
              context: context,
              message: "تم إضافة الملاحظة بنجاح ✅",
              isSuccess: true,
            );
          }

          /// ❌ ERROR
          if (state is AddNoteError) {
            showCustomSnackBar(context: context, message: state.message);
          }
        },
        builder: (context, state) {
          final isLoading = state is AddNoteLoading;

          return Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.w(16),
              right: SizeConfig.w(16),
              top: SizeConfig.h(44),
              bottom: SizeConfig.h(40),
            ),child: 
          
           Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "اكتب ملاحظاتك أو أي تفاصيل إضافية تحب فريقنا يعرفها",
                    style: AppTextStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: const Color(0xff555555)),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الملاحظات",
                      style: AppTextStyles.styleSemiBold16(context),
                    ),
                  ),

                  const SizedBox(height: 8),

                  NoteField(key: noteFieldKey, controller: _noteController),

                  const SizedBox(height: 40),

                  CustomTextBtn(
                    width: double.infinity,
                    text: 'حفظ',
                    isLoading: isLoading,
                    onPressed: isLoading
                        ? null
                        : () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            await context.read<NotesCubit>().addNote(
                              userId: widget.userId,
                              model: AddNoteModel(
                                note: _noteController.text.trim(),
                                files:
                                    noteFieldKey.currentState?.attachedFiles ??
                                    [],
                              ),
                            );
                          },
                  ),
                ],
              ),
            ),
            )  );
        },
      ),
    );
  }
}
