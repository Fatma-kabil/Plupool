import 'package:flutter/material.dart' hide TextField;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';
import 'package:plupool/features/notifications/data/models/notifiction_type_model.dart';
import 'package:plupool/features/notifications/presentation/views/widgets/notification_type_selector.dart';
import 'package:plupool/features/offers/presentation/views/widgets/field_label.dart';

class AddNotificationViewBody extends StatefulWidget {
  const AddNotificationViewBody({super.key});

  @override
  State<AddNotificationViewBody> createState() =>
      _AddNotificationViewBodyState();
}

class _AddNotificationViewBodyState
    extends State<AddNotificationViewBody> {
  final _formKey = GlobalKey<FormState>();

  NotificationType? selectedType;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    textController.dispose();
    super.dispose();
  }

  void _submit() {
    if (selectedType == null) {
      // ممكن هنا snackbar أو error
      return;
    }

    debugPrint('Type: ${selectedType!.title}');
    debugPrint('Title: ${nameController.text}');
    debugPrint('Body: ${textController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          /// ---------- المحتوى القابل للسكرول ----------
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// نوع الإشعار
                  const FieldLabel('نوع الإشعار'),
                  NotificationTypeSelector(
               
                    onChanged: (type) {
                      setState(() {
                        selectedType = type;
                      });
                    },
                  ),

                  const SizedBox(height: 22),

                  /// عنوان الإشعار
                  const FieldLabel('عنوان الإشعار'),
                  TextField(
                    controller: nameController,
                    hint: 'اكتب عنوان الإشعار...',
                  ),

                  const SizedBox(height: 22),

                  /// نص الإشعار
                  const FieldLabel('نص الإشعار'),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(4),
                      vertical: SizeConfig.h(6),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.textFieldBorderColor),
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

          /// ---------- الزرار ثابت تحت ----------
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.w(10),
              right: SizeConfig.w(10),
              bottom: SizeConfig.h(15),
            ),
            child: CustomTextBtn(
              text: "إرسال",
              onPressed: _submit,
              trailing: Icon(
                Icons.send,
                color: Colors.white,
                size: SizeConfig.w(17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
