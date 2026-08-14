import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/notifications/data/models/notifiction_type_model.dart';
import 'package:plupool/features/notifications/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:plupool/features/notifications/presentation/manager/notification_cubit/notification_state.dart';
import 'package:plupool/features/notifications/presentation/views/widgets/notification_type_selector.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class AddNotificationViewBody extends StatefulWidget {
  const AddNotificationViewBody({
    super.key,
    required this.userId,
  });

  final int? userId;

  @override
  State<AddNotificationViewBody> createState() =>
      _AddNotificationViewBodyState();
}

class _AddNotificationViewBodyState
    extends State<AddNotificationViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _typeKey = GlobalKey<NotificationTypeSelectorState>();

  NotificationType? selectedType;

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController textController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    textController.dispose();
    super.dispose();
  }

  void _submit() {
    if (widget.userId == null) {
      showCustomSnackBar(
        context: context,
        message: 'لم يتم تحديد المستخدم',
        isSuccess: false,
      );
      return;
    }

    if (!_typeKey.currentState!.validate()) {
      return;
    }

    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<NotificationCubit>().sendNotificationToUser(
          userId: widget.userId!,
          title: nameController.text.trim(),
          message: textController.text.trim(),
          type: selectedType!.type,
          data: const {
            'screen': 'notifications',
          },
        );
  }

  void _clearForm() {
    nameController.clear();
    textController.clear();

    setState(() {
      selectedType = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state is SendNotificationToUserSuccess) {
          showCustomSnackBar(
            context: context,
            message: 'تم إرسال الإشعار بنجاح',
            isSuccess: true,
          );

          _clearForm();
        }

        if (state is SendNotificationToUserFailure) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: false,
          );
        }
      },
      builder: (context, state) {
        final isLoading =
            state is SendNotificationToUserLoading;

        return Form(
          key: _formKey,
          child: Column(
            children: [
              /// ---------- المحتوى القابل للسكرول ----------
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      /// ---------- نوع الإشعار ----------
                      const FieldLabel('نوع الإشعار'),

                      NotificationTypeSelector(
                        key: _typeKey,
                        onChanged: (type) {
                          setState(() {
                            selectedType = type;
                          });
                        },
                      ),

                      const SizedBox(height: 22),

                      /// ---------- عنوان الإشعار ----------
                      const FieldLabel('عنوان الإشعار'),

                      TextField(
                        controller: nameController,
                        hint: 'اكتب عنوان الإشعار...',
                      ),

                      const SizedBox(height: 22),

                      /// ---------- نص الإشعار ----------
                      const FieldLabel('نص الإشعار'),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.w(4),
                          vertical: SizeConfig.h(6),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors
                                .textFieldBorderColor,
                          ),
                        ),
                        child: NoteTextField(
                          controller: textController,
                          text: 'اكتب نص الإشعار...',
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              /// ---------- زر الإرسال ----------
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.w(10),
                  right: SizeConfig.w(10),
                  bottom: SizeConfig.h(15),
                ),
                child: CustomTextBtn(
                  text: isLoading
                      ? 'جارٍ الإرسال...'
                      : 'إرسال',
                  onPressed: isLoading ? null : _submit,
                  trailing: isLoading
                      ? SizedBox(
                          width: SizeConfig.w(18),
                          height: SizeConfig.w(18),
                          child:
                              const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Icon(
                          Icons.send,
                          color: Colors.white,
                          size: SizeConfig.w(17),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}