import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/notes/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:plupool/features/notes/presentation/views/widgets/add_note_card.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';

class NotesViewHeader extends StatelessWidget {
  const NotesViewHeader({super.key, required this.userId});
  final int userId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "ملاحظات خاصة بالأدمن",
          style: AppTextStyles.styleSemiBold16(context),
        ),
        Spacer(),
        AddOfferBtn(
          text: "إضافة ملاحظة",
          icon: Icons.note_add_outlined,
          onTap: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return BlocProvider.value(
                  value: context.read<NotesCubit>(),
                  child: Dialog(
                    backgroundColor: AppColors.kScaffoldColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    insetPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(20),
                      vertical: SizeConfig.h(29),
                    ),
                    child: AddNoteCard(userId: userId),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
