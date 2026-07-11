import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/home/domain/params/add_support_message_params.dart';
import 'package:plupool/features/home/presentaation/manager/Add_support_message_cubit/add_support_message_cubit.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/done_contact_us_card.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/note_field.dart';
import 'package:plupool/features/profile/presentation/views/widgets/edit_btn.dart';

class SupportContactCard extends StatefulWidget {
  const SupportContactCard({super.key});

  @override
  State<SupportContactCard> createState() => _SupportContactCardState();
}

class _SupportContactCardState extends State<SupportContactCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<NoteFieldState> _noteFieldKey = GlobalKey<NoteFieldState>();

  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddSupportMessageCubit, AddSupportMessageState>(
      listener: (context, state) {
        if (state is AddSupportMessageSuccess) {
          _notesController.clear();

          showDialog(
            context: context,
            builder: (_) => const Dialog(
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.all(20),
              child: DoneContactUsCard(),
            ),
          );
        }

        if (state is AddSupportMessageError) {
          showCustomSnackBar(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.h(15),
            horizontal: SizeConfig.w(12),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تواصل مع الدعم",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),

                SizedBox(height: SizeConfig.h(15)),

                NoteField(key: _noteFieldKey, controller: _notesController),

                SizedBox(height: SizeConfig.h(25)),

                Directionality(
                  textDirection: TextDirection.ltr,
                  child: EditButton(
                    tittle: "إرسال",
                    icon: Icons.send_rounded,
                    isLoading: state is AddSupportMessageLoading,
                    onPressed: state is AddSupportMessageLoading
                        ? null
                        : () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            context
                                .read<AddSupportMessageCubit>()
                                .addSupportMessage(
                                  AddSupportMessageParams(
                                    title: "طلب دعم",
                                    message: _notesController.text.trim(),
                                    type: "support",
                                    files:
                                        _noteFieldKey
                                            .currentState
                                            ?.attachedFiles ??
                                        [],
                                  ),
                                );
                          },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
