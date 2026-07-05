import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/user_notes_cubit/user_notes_cubit.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/user_notes_cubit/user_notes_state.dart';
import 'package:plupool/features/notes/presentation/views/widgets/notes_shimmer_list.dart';
import 'package:plupool/features/support/presentation/views/widgets/attachment_chip.dart';

class ServiceNotesSection extends StatelessWidget {
  const ServiceNotesSection({super.key});

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserNotesCubit, UserNotesState>(
      builder: (context, state) {
        if (state is UserNotesLoading) {
          return NotesShimmerList();
        }

        if (state is UserNotesFailure) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is UserNotesSuccess) {
          if (state.userNotes.isEmpty) {
            return const SizedBox();
          }

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.userNotes.length,
            separatorBuilder: (_, __) =>
                SizedBox(height: SizeConfig.h(12)),
            itemBuilder: (context, index) {
              final note = state.userNotes[index];

              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(SizeConfig.w(12)),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff777777)),
                  borderRadius:
                      BorderRadius.circular(SizeConfig.w(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatMonthDate(note.createdAt),
                          style: AppTextStyles.styleRegular14(
                            context,
                          ).copyWith(
                            color: const Color(0xff777777),
                          ),
                        ),
                        Text(
                          formatTimeArabic2(note.createdAt),
                          style: AppTextStyles.styleRegular14(
                            context,
                          ).copyWith(
                            color: const Color(0xff777777),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.h(10)),
                    if (note.note.trim().isNotEmpty)
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Icon(
                            Icons.notes,
                            color: const Color(0xff999999),
                            size: SizeConfig.w(20),
                          ),
                          SizedBox(width: SizeConfig.w(6)),
                          Expanded(
                            child: Text(
                              note.note,
                              style: AppTextStyles.styleRegular14(
                                context,
                              ).copyWith(
                                color: const Color(0xff777777),
                              ),
                              textDirection: TextDirection.rtl,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    if (note.files.isNotEmpty) ...[
                      SizedBox(height: SizeConfig.h(10)),
                      Wrap(
                        spacing: SizeConfig.w(8),
                        runSpacing: SizeConfig.h(8),
                        children: List.generate(
                          note.files.length,
                          (fileIndex) {
                            final file = note.files[fileIndex];

                            return AttachmentChip(
                              fileName: file.originalName,
                              fileUrl: file.fileUrl,
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}