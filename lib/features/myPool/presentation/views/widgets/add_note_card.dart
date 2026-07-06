import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/consruction_service/data/models/user_note_model.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/user_notes_cubit/user_notes_cubit.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/user_notes_cubit/user_notes_state.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/note_field.dart';

class AddNoteCard extends StatefulWidget {
  const AddNoteCard({super.key});

  @override
  State<AddNoteCard> createState() => _AddNoteCardState();
}

class _AddNoteCardState extends State<AddNoteCard> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _noteController = TextEditingController();

  final GlobalKey<NoteFieldState> noteFieldKey = GlobalKey<NoteFieldState>();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<UserNotesCubit, UserNotesState>(
        listener: (context, state) {
          if (state is UserNotesAddedSuccessfully) {
            Navigator.pop(context);

            showCustomSnackBar(
              context: context,
              message: "تم حفظ الملاحظة بنجاح",
              isSuccess: true,
            );
          }

          if (state is UserNotesFailure) {
            showCustomSnackBar(
              context: context,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is UserNotesAdding;

          return Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.w(16),
              right: SizeConfig.w(16),
              top: SizeConfig.h(44),
              bottom: SizeConfig.h(40),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "اكتب ملاحظاتك أو أي تفاصيل إضافية تحب فريقنا يعرفها",
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "الملاحظات",
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                    ),

                    const SizedBox(height: 8),

                    NoteField(
                      key: noteFieldKey,
                      controller: _noteController,
                    ),

                    const SizedBox(height: 25),

                    CustomTextBtn(
                      padding: 8,
                      width: double.infinity,
                      text: 'حفظ',
                      isLoading: isLoading,
                      onPressed: isLoading
                          ? null
                          : () async {
                              if (!_formKey.currentState!.validate()) return;

                              await context.read<UserNotesCubit>().addUserNote(
                                    AddNoteModel(
                                      note: _noteController.text.trim(),
                                      files: noteFieldKey
                                              .currentState?.attachedFiles ??
                                          [],
                                    ),
                                  );
                            },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}