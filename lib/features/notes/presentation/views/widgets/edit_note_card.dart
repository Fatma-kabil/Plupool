import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/note_field.dart';
import 'package:plupool/features/notes/data/models/note_model.dart';
import 'package:plupool/features/notes/domain/entities/note_entity.dart';
import 'package:plupool/features/notes/domain/entities/note_file_entity.dart';
import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_state.dart';
import 'package:plupool/features/support/presentation/views/widgets/attachment_chip.dart';

class EditNoteCard extends StatefulWidget {
  const EditNoteCard({
    super.key,
    required this.note,
    required this.userId,
  });

  final NoteEntity note;
  final int userId;

  @override
  State<EditNoteCard> createState() => _EditNoteCardState();
}

class _EditNoteCardState extends State<EditNoteCard> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController noteController;

  final GlobalKey<NoteFieldState> noteFieldKey =
      GlobalKey<NoteFieldState>();

  /// الملفات القديمة
  late List<NoteFileEntity> oldFiles;

  /// الملفات المحذوفة
  final List<int> deletedFileIds = [];

  @override
  void initState() {
    super.initState();

    noteController = TextEditingController(
      text: widget.note.note,
    );

    oldFiles = List.from(widget.note.files);
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          /// SUCCESS
          if (state is UpdateNoteSuccess) {
            Navigator.pop(context);

            showCustomSnackBar(
              context: context,
              message: "تم تعديل الملاحظة بنجاح ✅",
              isSuccess: true,
            );
          }

          /// ERROR
          if (state is UpdateNoteError) {
            showCustomSnackBar(
              context: context,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is UpdateNoteLoading;

          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(20),
              vertical: SizeConfig.h(25),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// TITLE
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "الملاحظات",
                        style: AppTextStyles.styleSemiBold16(context),
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// NOTE FIELD
                    NoteField(
                      key: noteFieldKey,
                      controller: noteController,
                    ),

                    SizedBox(height: SizeConfig.h(15)),

                    /// FILES
                    (oldFiles.isNotEmpty ||
                            (noteFieldKey
                                    .currentState?.attachedFiles.isNotEmpty ??
                                false))
                        ? Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              /// OLD FILES
                              if (oldFiles.isNotEmpty)
                                Wrap(
                                  spacing: SizeConfig.w(8),
                                  runSpacing: SizeConfig.h(8),
                                  children: oldFiles.map((file) {
                                    return Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        AttachmentChip(
                                          fileName:
                                              file.originalName.isNotEmpty
                                                  ? file.originalName
                                                  : "ملف",
                                          fileUrl: file.fileUrl,
                                        ),

                                        /// DELETE OLD FILE
                                        Positioned(
                                          top: -SizeConfig.h(6),
                                          left: -SizeConfig.w(6),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                deletedFileIds
                                                    .add(file.id);

                                                oldFiles.remove(file);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                SizeConfig.w(2),
                                              ),
                                              decoration:
                                                  const BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size:
                                                    SizeConfig.w(12),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),

                              SizedBox(height: SizeConfig.h(10)),

                              /// NEW FILES
                              if (noteFieldKey.currentState
                                      ?.attachedFiles.isNotEmpty ??
                                  false)
                                Wrap(
                                  spacing: SizeConfig.w(8),
                                  runSpacing: SizeConfig.h(8),
                                  children: noteFieldKey
                                      .currentState!.attachedFiles
                                      .map((file) {
                                    return Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        AttachmentChip(
                                          fileName:
                                              file.path.split('/').last,
                                        ),

                                        /// DELETE NEW FILE
                                        Positioned(
                                          top: -SizeConfig.h(6),
                                          left: -SizeConfig.w(6),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                noteFieldKey
                                                    .currentState!
                                                    .attachedFiles
                                                    .remove(file);
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                SizeConfig.w(2),
                                              ),
                                              decoration:
                                                  const BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size:
                                                    SizeConfig.w(12),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                            ],
                          )
                        : Text(
                            'لا توجد ملفات',
                            style: AppTextStyles.styleRegular16(
                              context,
                            ).copyWith(
                              color: const Color(0xff777777),
                            ),
                          ),

                    SizedBox(height: SizeConfig.h(40)),

                    /// SAVE BTN
                    CustomTextBtn(
                      width: double.infinity,
                      text: 'حفظ',
                      isLoading: isLoading,
                      onPressed: isLoading
                          ? null
                          : () async {
                              final noteText =
                                  noteController.text.trim();

                              final hasOldFiles =
                                  oldFiles.isNotEmpty;

                              final hasNewFiles =
                                  noteFieldKey
                                          .currentState
                                          ?.attachedFiles
                                          .isNotEmpty ??
                                      false;

                              /// VALIDATION
                              if (noteText.isEmpty &&
                                  !hasOldFiles &&
                                  !hasNewFiles) {
                                showCustomSnackBar(
                                  context: context,
                                  message:
                                      'أضف ملاحظة أو ملف واحد على الأقل',
                                );

                                return;
                              }

                              /// DELETE OLD FILES
                              for (final fileId
                                  in deletedFileIds) {
                                await context
                                    .read<NotesCubit>()
                                    .deleteNoteFile(
                                      userId: widget.userId,
                                      noteId: widget.note.id,
                                      fileId: fileId,
                                    );
                              }

                              /// UPDATE NOTE
                              await context
                                  .read<NotesCubit>()
                                  .updateNote(
                                    userId: widget.userId,
                                    noteId: widget.note.id,
                                    model: UpdateNoteModel(
                                      note: noteText,
                                      files: noteFieldKey
                                              .currentState
                                              ?.attachedFiles ??
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